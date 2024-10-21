import 'package:flutter/material.dart';

class CambiarContrasena extends StatefulWidget {
  const CambiarContrasena({super.key});

  @override
  _CambiarContrasenaState createState() => _CambiarContrasenaState();
}

class _CambiarContrasenaState extends State<CambiarContrasena> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool _oldPasswordVisible = false;
  bool _newPasswordVisible = false;
  bool _repeatPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPasswordField(
              controller: _oldPasswordController,
              label: 'Contraseña antigua',
              isVisible: _oldPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _oldPasswordVisible = !_oldPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              controller: _newPasswordController,
              label: 'Contraseña nueva',
              isVisible: _newPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _newPasswordVisible = !_newPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 20),
            _buildPasswordField(
              controller: _repeatPasswordController,
              label: 'Repetir contraseña nueva',
              isVisible: _repeatPasswordVisible,
              toggleVisibility: () {
                setState(() {
                  _repeatPasswordVisible = !_repeatPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para cambiar la contraseña
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contraseña cambiada')),
                );
                Navigator.pop(context); // Regresar a la página anterior
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool isVisible,
    required VoidCallback toggleVisibility,
  }) {
    return TextField(
      controller: controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }
}
