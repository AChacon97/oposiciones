<<<<<<< Updated upstream
=======
import 'package:flutter/material.dart';

// Clase principal para la pantalla de registro
class PantallaRegistro extends StatelessWidget {
  const PantallaRegistro({super.key}); // Constructor de la clase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'), // Título de la barra de aplicación
      ),
      body: Center(
        // Centra todo el contenido en la pantalla
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Se eliminó el SizedBox en la parte superior
//daedaedaedda
              const Text(
                'Regístrate', // Texto de encabezado
                style: TextStyle(
                  fontSize: 28.0, // Tamaño de la letra
                  fontWeight: FontWeight.bold, // Estilo en negrita
                  color: Colors.blueAccent, // Color del texto
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(5.0, 10.0), // Desplazamiento de la sombra
                      blurRadius: 3.0, // Difuminado de la sombra
                      color: Colors.black26, // Color de la sombra
                    )
                  ],
                  letterSpacing: 2.0, // Espaciado entre letras
                ),
              ),
              const SizedBox(height: 30), // Espacio entre widgets

              // Contenedor para el campo de nombre de usuario
              Container(
                width: 475, // Ancho del contenedor
                child: const TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white, // Color del texto de sugerencia
                      fontSize: 20.0, // Tamaño del texto de sugerencia
                      fontWeight: FontWeight.bold, // Negrita
                    ),
                    hintText: 'Nombre de Usuario', // Texto de sugerencia
                    fillColor: Colors.red, // Color de fondo del campo
                    filled: true, // Habilitar el relleno
                  ),
                ),
              ),
              const SizedBox(height: 25), // Espacio entre widgets

              // Contenedor para el campo de correo electrónico
              Container(
                width: 475, // Ancho del contenedor
                child: const TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Correo Electrónico', // Texto de sugerencia
                    fillColor: Colors.red,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 25), // Espacio entre widgets

              // Contenedor para el campo de teléfono
              Container(
                width: 475, // Ancho del contenedor
                child: const TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Teléfono', // Texto de sugerencia
                    fillColor: Colors.red,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 25), // Espacio entre widgets

              // Contenedor para el campo de contraseña
              Container(
                width: 475, // Ancho del contenedor
                child: const TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Contraseña', // Texto de sugerencia
                    fillColor: Colors.red,
                    filled: true,
                  ),
                  obscureText: true, // Oculta el texto ingresado
                ),
              ),
              const SizedBox(height: 25), // Espacio entre widgets
              Registro(),
            ],
          ),
        ),
      ),
    );
  }
}

// Botón para registrar al usuario
Widget Registro() {
  return ElevatedButton(
    onPressed: () {
      // Aquí iría la lógica para registrar al usuario.
    },
    child: const Text('Registrar'), // Texto del botón
  );
}
>>>>>>> Stashed changes
