from flask import Flask, jsonify
from urllib.request import urlopen
import mysql.connector as mysql
import json

servico = Flask("produtos")

SERVIDOR_BANCO = "banco"
USUARIO_BANCO = "root"
SENHA_BANCO = "admin"
NOME_BANCO = "suplementos"


def get_conexao_com_bd():
    conexao = mysql.connect(host=SERVIDOR_BANCO, user=USUARIO_BANCO,
                            password=SENHA_BANCO, database=NOME_BANCO)

    return conexao


URL_LIKES = "http://likes:5000/likes_por_feed/"


def get_quantidade_de_curtidas(id_do_feed):
    url = URL_LIKES + str(id_do_feed)
    resposta = urlopen(url)
    resposta = resposta.read()
    resposta = json.loads(resposta)

    return resposta["curtidas"]


@servico.get("/info")
def get_info():
    return jsonify(
        descricao="gerenciamento de produtos dos suplementos",
        versao="1.0"
    )


@servico.get("/produtos/<int:ultimo_feed>/<int:tamanho_da_pagina>")
def get_produtos(ultimo_feed, tamanho_da_pagina):
    produtos = []

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "SELECT feeds.id as produto_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "empresas.id as empresa_id, empresas.nome as nome_empresa, empresas.avatar, produtos.nome as nome_produto, produtos.descricao, FORMAT(produtos.preco, 2) as preco, " +
        "produtos.url, produtos.imagem1, IFNULL(produtos.imagem2, '') as imagem2, IFNULL(produtos.imagem3, '') as imagem3 " +
        "FROM feeds, produtos, empresas " +
        "WHERE produtos.id = feeds.produto " +
        "AND empresas.id = produtos.empresa " +
        "AND feeds.id > " + str(ultimo_feed) + " ORDER BY produto_id ASC, data DESC " +
        "LIMIT " + str(tamanho_da_pagina)
    )
    produtos = cursor.fetchall()
    if produtos:
        for produto in produtos:
            produto["curtidas"] = get_quantidade_de_curtidas(
                produto['produto_id'])

    conexao.close()

    return jsonify(produtos)


@servico.get("/produtos/<int:ultimo_feed>/<int:tamanho_da_pagina>/<string:nome_do_produto>")
def find_produtos(ultimo_feed, tamanho_da_pagina, nome_do_produto):
    produtos = []

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "select feeds.id as produto_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "empresas.id as empresa_id, empresas.nome as nome_empresa, empresas.avatar, produtos.nome as nome_produto, produtos.descricao, FORMAT(produtos.preco, 2) as preco, " +
        "produtos.url, produtos.imagem1, IFNULL(produtos.imagem2, '') as imagem2, IFNULL(produtos.imagem3, '') as imagem3 " +
        "FROM feeds, produtos, empresas " +
        "WHERE produtos.id = feeds.produto " +
        "AND empresas.id = produtos.empresa " +
        "AND produtos.nome LIKE '%" + nome_do_produto + "%' " +
        "AND feeds.id > " + str(ultimo_feed) + " ORDER BY produto_id ASC, data DESC " +
        "LIMIT " + str(tamanho_da_pagina)
    )
    produtos = cursor.fetchall()
    if produtos:
        for produto in produtos:
            produto["curtidas"] = get_quantidade_de_curtidas(
                produto['produto_id'])

    conexao.close()

    return jsonify(produtos)


@servico.get("/produto/<int:feed>")
def find_produto(feed):
    produto = {}

    conexao = get_conexao_com_bd()
    cursor = conexao.cursor(dictionary=True)
    cursor.execute(
        "select feeds.id as produto_id, DATE_FORMAT(feeds.data, '%Y-%m-%d %H:%i') as data, " +
        "empresas.id as empresa_id, empresas.nome as nome_empresa, empresas.avatar, produtos.nome as nome_produto, produtos.descricao, FORMAT(produtos.preco, 2) as preco, " +
        "produtos.url, produtos.imagem1, IFNULL(produtos.imagem2, '') as imagem2, IFNULL(produtos.imagem3, '') as imagem3 " +
        "FROM feeds, produtos, empresas " +
        "WHERE produtos.id = feeds.produto " +
        "AND empresas.id = produtos.empresa " +
        "AND feeds.id = " + str(feed)
    )
    produto = cursor.fetchone()
    if produto:
        produto["curtidas"] = get_quantidade_de_curtidas(feed)

    conexao.close()

    return jsonify(produto)


if __name__ == "__main__":
    servico.run(host="0.0.0.0", debug=True)
