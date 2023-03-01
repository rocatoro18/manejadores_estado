import 'package:estados/models/usuario.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final nuevoUsuario = currentState.usuario.copyWith(edad: edad);
      // currentState.usuario.edad = 24;
      emit(UsuarioActivo(nuevoUsuario));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final nuevaProfesion = [
        ...?currentState.usuario.profesiones,
        'Profesion : ${currentState.usuario.profesiones!.length + 1}'
      ];
      final nuevoUsuario =
          currentState.usuario.copyWith(profesiones: nuevaProfesion);
      emit(UsuarioActivo(nuevoUsuario));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
