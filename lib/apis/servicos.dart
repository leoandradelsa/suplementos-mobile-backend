// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:suplementos/autenticador.dart';

final URL_SERVICOS = Uri.parse("http://10.0.2.2");

final URL_SUPLEMENTOS = "${URL_SERVICOS.toString()}:5001/produtos";
final URL_PRODUTO = "${URL_SERVICOS.toString()}:5001/produto";

final URL_COMENTARIOS = "${URL_SERVICOS.toString()}:5002/comentarios";
final URL_ADICIONAR_COMENTARIO = "${URL_SERVICOS.toString()}:5002/adicionar";
final URL_REMOVER_COMENTARIO = "${URL_SERVICOS.toString()}:5002/remover";

final URL_CURTIU = "${URL_SERVICOS.toString()}:5003/curtiu";
final URL_CURTIR = "${URL_SERVICOS.toString()}:5003/curtir";
final URL_DESCURTIR = "${URL_SERVICOS.toString()}:5003/descurtir";

final URL_ARQUIVOS = "${URL_SERVICOS.toString()}:5005";

class ServicoSuplementos {
  Future<List<dynamic>> getProdutos(
      int ultimoProduto, int tamanhoPagina) async {
    final resposta = await http.get(Uri.parse(
        "${URL_SUPLEMENTOS.toString()}/$ultimoProduto/$tamanhoPagina"));
    final produtos = jsonDecode(resposta.body);

    return produtos;
  }

  Future<List<dynamic>> findProdutos(
      int ultimoProduto, int tamanhoPagina, String nome) async {
    final resposta = await http.get(Uri.parse(
        "${URL_SUPLEMENTOS.toString()}/$ultimoProduto/$tamanhoPagina/$nome"));
    final produtos = jsonDecode(resposta.body);

    return produtos;
  }

  Future<Map<String, dynamic>> findProduto(int idProduto) async {
    final resposta =
        await http.get(Uri.parse("${URL_PRODUTO.toString()}/$idProduto"));
    final produtos = jsonDecode(resposta.body);

    return produtos;
  }
}

class ServicoCurtidas {
  Future<bool> curtiu(Usuario usuario, int idProduto) async {
    final resposta = await http
        .get(Uri.parse("${URL_CURTIU.toString()}/${usuario.email}/$idProduto"));
    final resultado = jsonDecode(resposta.body);

    return resultado["curtiu"] as bool;
  }

  Future<dynamic> curtir(Usuario usuario, int idProduto) async {
    final resposta = await http.post(
        Uri.parse("${URL_CURTIR.toString()}/${usuario.email}/$idProduto"));

    return jsonDecode(resposta.body);
  }

  Future<dynamic> descurtir(Usuario usuario, int idProduto) async {
    final resposta = await http.post(
        Uri.parse("${URL_DESCURTIR.toString()}/${usuario.email}/$idProduto"));

    return jsonDecode(resposta.body);
  }
}

class ServicoComentarios {
  Future<List<dynamic>> getComentarios(
      int idProduto, int pagina, int tamanhoPagina) async {
    final resposta = await http.get(Uri.parse(
        "${URL_COMENTARIOS.toString()}/$idProduto/$pagina/$tamanhoPagina"));
    final comentarios = jsonDecode(resposta.body);

    return comentarios;
  }

  Future<dynamic> adicionar(
      int idProduto, Usuario usuario, String comentario) async {
    final resposta = await http.post(Uri.parse(
        "${URL_ADICIONAR_COMENTARIO.toString()}/$idProduto/${usuario.nome}/${usuario.email}/$comentario"));

    return jsonDecode(resposta.body);
  }

  Future<dynamic> remover(int idComentario) async {
    final resposta = await http.delete(
        Uri.parse("${URL_REMOVER_COMENTARIO.toString()}/$idComentario"));

    return jsonDecode(resposta.body);
  }
}

String caminhoArquivo(String arquivo) {
  return "${URL_ARQUIVOS.toString()}/$arquivo";
}
