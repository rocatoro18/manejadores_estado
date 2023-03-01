import 'package:estados/models/usuario.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuarios_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }
}
