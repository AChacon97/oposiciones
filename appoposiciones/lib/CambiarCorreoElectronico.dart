import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'theme.dart'; // Importa el archivo que contiene el tema

// Clase principal para cambiar el correo electrónico
class CambiarCorreoElectronico extends StatelessWidget {
  // Controladores para los campos de texto del correo electrónico
  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _repeatNewEmailController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Cambiar Correo Electrónico'), // Título de la barra de aplicación
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            // Etiqueta para el correo electrónico actual
            Text(
              'Correo electrónico actual:',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), // Estilo de texto
            ),
            const SizedBox(height: 10), // Espaciado vertical
            // Campo para ingresar el correo electrónico actual
            TextField(
              controller: _currentEmailController, // Asigna el controlador
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Bordes del campo
                hintText:
                    'Escribe tu correo electrónico actual', // Texto de sugerencia
              ),
            ),
            const SizedBox(height: 20), // Espaciado vertical
            // Etiqueta para el nuevo correo electrónico
            Text(
              'Correo electrónico nuevo:',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), // Estilo de texto
            ),
            const SizedBox(height: 10), // Espaciado vertical
            // Campo para ingresar el nuevo correo electrónico
            TextField(
              controller: _newEmailController, // Asigna el controlador
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Bordes del campo
                hintText:
                    'Escribe tu nuevo correo electrónico', // Texto de sugerencia
              ),
            ),
            const SizedBox(height: 20), // Espaciado vertical
            // Etiqueta para repetir el nuevo correo electrónico
            Text(
              'Repetir correo electrónico nuevo:',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold), // Estilo de texto
            ),
            const SizedBox(height: 10), // Espaciado vertical
            // Campo para repetir el nuevo correo electrónico
            TextField(
              controller: _repeatNewEmailController, // Asigna el controlador
              decoration: InputDecoration(
                border: OutlineInputBorder(), // Bordes del campo
                hintText:
                    'Repite tu nuevo correo electrónico', // Texto de sugerencia
              ),
            ),
            const SizedBox(height: 20), // Espaciado vertical
            // Botón para guardar los cambios
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para cambiar el correo electrónico
                // Verifica si los nuevos correos electrónicos coinciden
                if (_newEmailController.text ==
                    _repeatNewEmailController.text) {
                  // Muestra un mensaje de éxito
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Correo electrónico cambiado')), // Mensaje de confirmación
                  );
                  Navigator.pop(context); // Regresar a la página anterior
                } else {
                  // Muestra un mensaje de error si no coinciden
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Los correos electrónicos no coinciden')), // Mensaje de error
                  );
                }
              },
              child: const Text('Guardar Cambios'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
