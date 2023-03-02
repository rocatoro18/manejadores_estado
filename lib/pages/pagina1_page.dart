import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                userBloc.add(DeleteUserEvent());
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
        return state.existUser
            ? InformacionUsuario(usuario: state.user!)
            : const Center(
                child: Text('No hay usuario seleccionado'),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
        child: const Icon(Icons.accessibility_new),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    super.key,
    required this.usuario,
  });

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones!
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
