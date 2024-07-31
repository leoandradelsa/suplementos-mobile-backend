import 'package:firebase_auth/firebase_auth.dart';
import 'package:flat_list/flat_list.dart';
import 'package:flutter/material.dart';
import 'package:suplementos/apis/servicos.dart';
import 'package:suplementos/autenticador.dart';
import 'package:suplementos/components/suplemento_card.dart';
import 'package:suplementos/estado.dart';
import 'package:suplementos/services/auth_service.dart';

class Suplementos extends StatefulWidget {
  const Suplementos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SuplementosState();
  }
}

const int tamanhoPagina = 4;

class _SuplementosState extends State<Suplementos> {
  List<dynamic> _suplementos = [];

  bool _carregando = false;
  int _ultimoProduto = 0;

  late ServicoSuplementos _servicoSuplementos;

  @override
  void initState() {
    _recuperarUsuarioLogado();

    _servicoSuplementos = ServicoSuplementos();
    _carregarSuplementos();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _recuperarUsuarioLogado() {
    final usuario = FirebaseAuth.instance.currentUser;
    if (usuario != null) {
      final usuarioLogado = Usuario(usuario.displayName!, usuario.email!);

      Future.microtask(() {
        estadoApp.onLogin(usuarioLogado);
      });
    }
  }

  void _carregarSuplementos() {
    setState(() {
      _carregando = true;
    });

    _servicoSuplementos
        .getProdutos(_ultimoProduto, tamanhoPagina)
        .then((produtos) {
      setState(() {
        _carregando = false;
        _ultimoProduto =
            produtos.isNotEmpty ? produtos.last["produto_id"] : _ultimoProduto;

        _suplementos.addAll(produtos);
      });
    });
  }

  Future<void> _atualizarSuplementos() async {
    _suplementos = [];
    _ultimoProduto = 0;

    _carregarSuplementos();
  }

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    bool usuarioLogado = estadoApp.usuario != null;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: const Text("Suplementos"),
          actions: [
            usuarioLogado
                ? IconButton(
                    onPressed: () {
                      signUserOut;
                      setState(() {
                        estadoApp.onLogout();
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Você não está mais conectado")),
                      );
                    },
                    icon: const Icon(Icons.logout))
                : IconButton(
                    onPressed: () {
                      AuthService().signInWithGoogle();

                      String nome =
                          FirebaseAuth.instance.currentUser!.displayName!;
                      String email = FirebaseAuth.instance.currentUser!.email!;

                      Usuario usuario = Usuario(nome, email);

                      setState(() {
                        estadoApp.onLogin(usuario);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text("Você foi conectado como $nome")),
                      );
                    },
                    icon: const Icon(Icons.login))
          ],
        ),
        body: FlatList(
            data: _suplementos,
            numColumns: 2,
            loading: _carregando,
            onRefresh: () {
              return _atualizarSuplementos();
            },
            onEndReached: () => _carregarSuplementos(),
            onEndReachedDelta: 200,
            buildItem: (item, int indice) {
              return SizedBox(
                  height: 400, child: SuplementoCard(suplemento: item));
            }));
  }
}
