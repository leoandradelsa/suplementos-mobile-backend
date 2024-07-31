// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';
import 'package:suplementos/autenticador.dart';

enum Situacao { mostrandoProdutos, mostrandoDetalhes }

class EstadoApp extends ChangeNotifier {
  int _idProduto = 0;
  int get idProduto => _idProduto;
  set idProduto(int idProduto) {
    _idProduto = idProduto;
  }

  Usuario? _usuario;
  Usuario? get usuario => _usuario;
  set usuario(Usuario? usuario) {
    _usuario = usuario;
  }

  void mostrarDetalhes(int idProduto) {
    _idProduto = idProduto;

    notifyListeners();
  }

  void onLogin(Usuario usuario) {
    _usuario = usuario;

    notifyListeners();
  }

  void onLogout() {
    _usuario = null;

    notifyListeners();
  }
}

late EstadoApp estadoApp;
