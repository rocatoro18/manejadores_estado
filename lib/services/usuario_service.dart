import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';

class UsuarioService with ChangeNotifier {
  //propiedad
  Usuario? _usuario; //privado para definir lectura y escritura

  //getter que regresara el mismo usuario, retorna la instancia
  Usuario? get usuario => this._usuario;

  //getter para identificar si tenemos cargado un usuario o no, si es diferente de null regresa true y si es igual a null regresa false ternario
  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario? user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }
}
