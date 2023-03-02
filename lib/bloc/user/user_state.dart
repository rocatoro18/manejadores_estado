part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user});
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

// Clase generadora de estados
class UserSetState extends UserState {
  final Usuario nuevoUsuario;
  const UserSetState(this.nuevoUsuario)
      : super(existUser: true, user: nuevoUsuario);
}
