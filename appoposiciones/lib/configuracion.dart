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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: AppTheme.botonConfiguracion(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Estadisticas()),
                  );
                },
                child: const Text('Estadísticas'),
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
                child: const Text('Actualizar Nombre'),
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
                child: const Text('Modificar Contraseña'),
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
                child: const Text('Actualizar Correo'),
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
                child: const Text('Cambiar Imagen de Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
