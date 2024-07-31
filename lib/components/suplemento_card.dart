import 'package:flutter/material.dart';
import 'package:suplementos/apis/servicos.dart';
import 'package:suplementos/estado.dart';
import 'package:suplementos/pages/detalhes.dart';

class SuplementoCard extends StatefulWidget {
  final dynamic suplemento;

  const SuplementoCard({super.key, required this.suplemento});

  @override
  State<SuplementoCard> createState() => _SuplementoCardState();
}

class _SuplementoCardState extends State<SuplementoCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        estadoApp.mostrarDetalhes(widget.suplemento["produto_id"]);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Detalhes()),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: Image.network(
                  caminhoArquivo(widget.suplemento["imagem1"]),
                  height: 150,
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                Image.network(caminhoArquivo(widget.suplemento["avatar"]),
                    width: 34),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.suplemento["nome_produto"],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5, bottom: 10),
              child: Text(
                widget.suplemento["descricao"],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "R\$ ${widget.suplemento["preco"].toString()}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: 18,
                    ),
                    Text(
                      widget.suplemento["curtidas"].toString(),
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
