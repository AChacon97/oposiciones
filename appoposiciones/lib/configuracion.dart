import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'CambiarNombreUsuario.dart'; // Importa la página para cambiar el nombre de usuario
import 'CambiarContrasena.dart'; // Importa la página para cambiar la contraseña
import 'CambiarCorreoElectronico.dart'; // Importa la página para cambiar el correo electrónico
import 'CambiarFotoDePerfil.dart'; // Importa la página para cambiar la foto de perfil

// Clase principal que representa la pantalla de configuración
class Configuracion extends StatelessWidget {
  const Configuracion({super.key}); // Constructor de la clase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'), // Título de la barra de aplicación
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alineación a la izquierda
          children: [
            // Opción para cambiar el nombre de usuario
            GestureDetector(
              onTap: () {
                // Navega a la página CambiarNombreUsuario al tocar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarNombreUsuario()),
                );
              },
              child: Text(
                'Cambiar Nombre de Usuario', // Texto del enlace
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Estilo del texto
              ),
            ),
            const SizedBox(height: 20), // Espacio entre las opciones
            // Opción para cambiar la contraseña
            GestureDetector(
              onTap: () {
                // Navega a la página CambiarContrasena al tocar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarContrasena()),
                );
              },
              child: Text(
                'Cambiar Contraseña', // Texto del enlace
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Estilo del texto
              ),
            ),
            const SizedBox(height: 20), // Espacio entre las opciones
            // Opción para cambiar el correo electrónico
            GestureDetector(
              onTap: () {
                // Navega a la página CambiarCorreoElectronico al tocar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarCorreoElectronico()),
                );
              },
              child: Text(
                'Cambiar Correo Electrónico', // Texto del enlace
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Estilo del texto
              ),
            ),
            const SizedBox(height: 20), // Espacio entre las opciones
            // Opción para cambiar la foto de perfil
            GestureDetector(
              onTap: () {
                // Navega a la página CambiarFotoDePerfil al tocar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarFotoDePerfil()),
                );
              },
              child: Text(
                'Cambiar Foto de Perfil', // Texto del enlace
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Estilo del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
