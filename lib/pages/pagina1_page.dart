import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () {
                // remover usuario
                usuarioService.removerUsuario();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(
              usuario: usuarioService.usuario!,
            )
          : const Center(
              child: Text('No hay usuario seleccionado'),
            ),
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
          // Desestructuracion
          ...usuario.profesiones!
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList()
        ],
      ),
    );
  }
}
