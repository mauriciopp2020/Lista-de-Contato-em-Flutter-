import 'dart:math';

import 'package:contato/dummy_usuario.dart';
import 'package:contato/modelo/usuario.dart';
import 'package:flutter/cupertino.dart';


class Users with ChangeNotifier {
  final Map<String, Usuario> _items = {...dummy_usuario};
  List<Usuario> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Usuario byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Usuario usuario) {
    if (usuario == null) {
      return;
    }

    if (usuario.id != null &&
        usuario.id!.trim().isNotEmpty &&
        _items.containsKey(usuario.id)) {
      _items.update(
          usuario.id!,
          (_) => Usuario(
              id: usuario.id,
              nome: usuario.nome,
              numero: usuario.numero,
              foto: usuario.foto));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Usuario(
              id: id,
              nome: usuario.nome,
              numero: usuario.numero,
              foto: usuario.foto));
    }

    notifyListeners();
  }

  void remove(Usuario usuario) {
    if (usuario != null && usuario.id != null) {
      _items.remove(usuario.id);
      notifyListeners();
    }
  }
}
