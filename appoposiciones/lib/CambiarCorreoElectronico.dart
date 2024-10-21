import 'package:flutter/material.dart';

class CambiarCorreoElectronico extends StatelessWidget {
  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _repeatNewEmailController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Correo Electrónico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Correo electrónico actual:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _currentEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe tu correo electrónico actual',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Correo electrónico nuevo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _newEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe tu nuevo correo electrónico',
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Repetir correo electrónico nuevo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _repeatNewEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Repite tu nuevo correo electrónico',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes implementar la lógica para cambiar el correo electrónico
                if (_newEmailController.text ==
                    _repeatNewEmailController.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Correo electrónico cambiado')),
                  );
                  Navigator.pop(context); // Regresar a la página anterior
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Los correos electrónicos no coinciden')),
                  );
                }
              },
              child: const Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
