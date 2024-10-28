import 'package:flutter/material.dart';
import 'CambiarNombreUsuario.dart';
import 'CambiarContrasena.dart';
import 'CambiarCorreoElectronico.dart';
import 'CambiarFotoDePerfil.dart';
import 'theme.dart';
import 'estadisticas.dart';

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
            ElevatedButton(
              style: AppTheme.botonConfiguracion(),
              onPressed: () {
                // Aquí puedes añadir la función de navegación a la pantalla de estadísticas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Estadisticas()),
                );
              },
              child: Text('Estadísticas'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: AppTheme.botonConfiguracion(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarNombreUsuario()),
                );
              },
              child: Text('Actualizar Nombre'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: AppTheme.botonConfiguracion(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarContrasena()),
                );
              },
              child: Text('Modificar Contraseña'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: AppTheme.botonConfiguracion(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarCorreoElectronico()),
                );
              },
              child: Text('Actualizar Correo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: AppTheme.botonConfiguracion(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CambiarFotoDePerfil()),
                );
              },
              child: Text('Cambiar Imagen de Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
