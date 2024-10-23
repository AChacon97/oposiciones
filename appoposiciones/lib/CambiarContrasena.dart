import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'theme.dart'; // Importa el archivo que contiene el tema

// Clase principal para cambiar la contraseña
class CambiarContrasena extends StatefulWidget {
  const CambiarContrasena({super.key}); // Constructor de la clase

  @override
  _CambiarContrasenaState createState() =>
      _CambiarContrasenaState(); // Crea el estado de la pantalla
}

// Clase que maneja el estado de la pantalla de cambio de contraseña
class _CambiarContrasenaState extends State<CambiarContrasena> {
  // Controladores para los campos de texto de las contraseñas
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  // Variables booleanas para controlar la visibilidad de las contraseñas
  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _repeatPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Cambiar Contraseña'), // Título de la barra de aplicación
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            // Campo para la contraseña antigua
            _buildPasswordField(
              controller: _oldPasswordController, // Controlador de texto
              label: 'Contraseña antigua', // Etiqueta del campo
              isVisible: _oldPasswordVisible, // Controla la visibilidad
              toggleVisibility: () {
                // Función para alternar la visibilidad
                setState(() {
                  _oldPasswordVisible =
                      !_oldPasswordVisible; // Cambia el estado
                });
              },
            ),
            const SizedBox(height: 20), // Espaciado vertical
            // Campo para la nueva contraseña
            _buildPasswordField(
              controller: _newPasswordController, // Controlador de texto
              label: 'Contraseña nueva', // Etiqueta del campo
              isVisible: _newPasswordVisible, // Controla la visibilidad
              toggleVisibility: () {
                // Función para alternar la visibilidad
                setState(() {
                  _newPasswordVisible =
                      !_newPasswordVisible; // Cambia el estado
                });
              },
            ),
            const SizedBox(height: 20), // Espaciado vertical
            // Campo para repetir la nueva contraseña
            _buildPasswordField(
              controller: _repeatPasswordController, // Controlador de texto
              label: 'Repetir contraseña nueva', // Etiqueta del campo
              isVisible: _repeatPasswordVisible, // Controla la visibilidad
              toggleVisibility: () {
                // Función para alternar la visibilidad
                setState(() {
                  _repeatPasswordVisible =
                      !_repeatPasswordVisible; // Cambia el estado
                });
              },
            ),
            const SizedBox(height: 20), // Espaciado vertical
            // Botón para guardar los cambios
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para cambiar la contraseña
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Contraseña cambiada')), // Mensaje de confirmación
                );
                Navigator.pop(context); // Regresar a la página anterior
              },
              child: const Text('Guardar Cambios'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }

  // Método para construir un campo de texto para contraseñas
  Widget _buildPasswordField({
    required TextEditingController
        controller, // Controlador para el campo de texto
    required String label, // Etiqueta del campo
    required bool isVisible, // Controla la visibilidad de la contraseña
    required VoidCallback
        toggleVisibility, // Función para alternar la visibilidad
  }) {
    return TextField(
      controller: controller, // Asigna el controlador al campo de texto
      obscureText: !isVisible, // Oculta el texto si isVisible es false
      decoration: InputDecoration(
        labelText: label, // Muestra la etiqueta
        border: OutlineInputBorder(), // Bordes del campo
        suffixIcon: IconButton(
          icon: Icon(
            isVisible
                ? Icons.visibility
                : Icons.visibility_off, // Icono de visibilidad
          ),
          onPressed: toggleVisibility, // Alterna la visibilidad al presionar
        ),
      ),
    );
  }
}
