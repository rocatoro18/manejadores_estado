import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUserEvent>((event, emit) {
      emit(UserSetState(event.user));
      print('ActivateUserEvent called');
    });

    on<ChangeUserAgeEvent>((event, emit) {
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;
      // Extraer y agregar profesiones
      final professions = [...?state.user!.profesiones, event.profession];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });

    on<DeleteUserEvent>((event, emit) {
      emit(const UserInitialState());
    });
  }
}
