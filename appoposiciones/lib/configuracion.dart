import 'package:flutter/material.dart';
import 'CambiarNombreUsuario.dart';
import 'CambiarContrasena.dart';
import 'CambiarCorreoElectronico.dart';
import 'CambiarFotoDePerfil.dart'; // Asegúrate de importar la página CambiarFotoDePerfil

class Configuracion extends StatelessWidget {
  const Configuracion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarNombreUsuario()),
                );
              },
              child: Text(
                'Cambiar Nombre de Usuario',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarContrasena()),
                );
              },
              child: Text(
                'Cambiar Contraseña',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarCorreoElectronico()),
                );
              },
              child: Text(
                'Cambiar Correo Electrónico',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarFotoDePerfil()),
                );
              },
              child: Text(
                'Cambiar Foto de Perfil',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
