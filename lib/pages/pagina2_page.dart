import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                // Obtener instancia de nuestro bloc que se encuentra en algun lado del contexto
                final Usuario nuevoUsuario = Usuario(
                    nombre: 'Roberto',
                    edad: 23,
                    profesiones: [
                      'Flutter Developer',
                      'Android Dev',
                      'iOS Dev'
                    ]);
                userBloc.add(ActivateUserEvent(nuevoUsuario));
              },
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(ChangeUserAgeEvent(24));
              },
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(AddProfession('Nueva Profesion'));
              },
              color: Colors.blue,
              child: const Text(
                'Añadir profession',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
