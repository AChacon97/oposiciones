import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'CambiarNombreUsuario.dart'; // Importa la página para cambiar el nombre de usuario
import 'CambiarContrasena.dart'; // Importa la página para cambiar la contraseña
import 'CambiarCorreoElectronico.dart'; // Importa la página para cambiar el correo electrónico
import 'CambiarFotoDePerfil.dart'; // Importa la página para cambiar la foto de perfil
import 'theme.dart'; // Importa el archivo que contiene el tema

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
            // Botón para cambiar el nombre de usuario
            ElevatedButton(
              style: AppTheme
                  .botonConfiguracion(), // Aplica tu estilo de botón funcional
              onPressed: () {
                // Navega a la página CambiarNombreUsuario al presionar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarNombreUsuario()),
                );
              },
              child: Text('Actualizar Nombre'), // Texto del botón
            ),
            const SizedBox(height: 20), // Espacio entre las opciones
            // Botón para cambiar la contraseña
            ElevatedButton(
              style: AppTheme.botonConfiguracion(), // Aplica tu estilo d
              onPressed: () {
                // Navega a la página CambiarContrasena al presionar
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarContrasena()),
                );
              },
              child: Text('Modificar Contraseña'), // Texto del botón
            ),
            const SizedBox(height: 20), // Espacio entre las opciones
            // Botón para cambiar el correo electrónico
            ElevatedButton(
              style: AppTheme.botonConfiguracion(), // Aplica tu estilo d
              onPressed: () {
                // Navega a la página CambiarCorreoElectronico al presionar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarCorreoElectronico()),
                );
              },
              child: Text('Actualizar Correo'), // Texto del botón
            ),
            const SizedBox(height: 20), // Espacio entre las opciones
            // Botón para cambiar la foto de perfil
            ElevatedButton(
              style: AppTheme.botonConfiguracion(), // Aplica tu estilo d
              onPressed: () {
                // Navega a la página CambiarFotoDePerfil al presionar
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CambiarFotoDePerfil()),
                );
              },
              child: Text('Cambiar Imagen de Perfil'), // Texto del botón
            ),
          ],
        ),
      ),
    );
  }
}
