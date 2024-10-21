import 'package:flutter/material.dart';

class CambiarNombreUsuario extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Nombre de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre de usuario nuevo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), // Espacio entre el texto y el campo
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe tu nuevo nombre de usuario',
              ),
            ),
            const SizedBox(height: 20), // Espacio entre el campo y el botón
            ElevatedButton(
              onPressed: () {
                // Obtener el nuevo nombre de usuario
                String nuevoNombre = _controller.text;

                // Mostrar el nombre de usuario cambiado en un SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Nombre de usuario cambiado a: $nuevoNombre')),
                );

                // Regresar a la página anterior
                Navigator.pop(context);
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
