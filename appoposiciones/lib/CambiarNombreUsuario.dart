import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'theme.dart'; // Importa el archivo que contiene el tema

// Clase principal para cambiar el nombre de usuario
class CambiarNombreUsuario extends StatelessWidget {
  final TextEditingController _controller =
      TextEditingController(); // Controlador para el campo de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Cambiar Nombre de Usuario'), // Título de la barra de aplicación
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            // Etiqueta para el nuevo nombre de usuario
            Text(
              'Nombre de usuario nuevo:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold), // Estilo del texto
            ),
            const SizedBox(height: 10), // Espacio entre el texto y el campo
            // Campo para ingresar el nuevo nombre de usuario
            TextField(
              controller:
                  _controller, // Asigna el controlador para manejar el texto
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Bordes del campo de texto
                hintText:
                    'Escribe tu nuevo nombre de usuario', // Texto de sugerencia
              ),
            ),
            const SizedBox(height: 20), // Espacio entre el campo y el botón
            // Botón para guardar el nuevo nombre de usuario
            ElevatedButton(
              onPressed: () {
                // Obtener el nuevo nombre de usuario desde el controlador
                String nuevoNombre = _controller.text;

                // Mostrar un mensaje de confirmación en un SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Nombre de usuario cambiado a: $nuevoNombre')), // Mensaje que muestra el nuevo nombre
                );

                // Regresar a la página anterior
                Navigator.pop(context); // Cierra la pantalla actual
              },
              child: const Text('Guardar Cambios'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
