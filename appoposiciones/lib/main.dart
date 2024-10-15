import 'package:appoposiciones/registro.dart'; // Importa la pantalla de registro
import 'package:flutter/material.dart'; // Importa el paquete de Material Design
import 'package:firebase_core/firebase_core.dart'; // Importa el paquete para Firebase
import 'firebase_options.dart'; // Importa la configuración de Firebase

// Función principal que se ejecuta al iniciar la aplicación
void main() async {
  // Inicializa Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Ejecuta la aplicación
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor de la clase

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Título de la aplicación
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple), // Tema de la aplicación
        useMaterial3: true, // Usar el diseño Material 3
      ),
      home:
          const MyHomePage(title: 'Flutter Demo Home Page'), // Página principal
    );
  }
}

// Clase para la página principal
class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key, required this.title}); // Constructor con el título

  final String title; // Variable para almacenar el título

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Estado de la página
}

// Clase para el estado de MyHomePage
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary, // Color de la AppBar
        title: const Text('PROYECTO'), // Título de la AppBar
      ),
      body: Padding(
        padding:
            const EdgeInsets.all(20.0), // Espaciado alrededor del contenido
        child: Column(
          mainAxisSize: MainAxisSize.max, // Ocupa el máximo espacio posible
          children: <Widget>[
            // Imagen de la autoescuela
            Image.asset(
              "assets/images/Imagen de WhatsApp 2024-09-29 a las 14.01.40_25073ee1 - copia.jpg",
              height: 100, // Altura de la imagen
              width: 150, // Ancho de la imagen
            ),
            const Text(
              'BIENVENIDOS A TU APP DE AUTOESCUELA', // Texto de bienvenida
              style: TextStyle(
                fontSize: 28.0, // Tamaño de la letra
                fontWeight: FontWeight.bold, // La letra en negrita
                color: Colors.blueAccent, // Color de la letra
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
            const SizedBox(height: 30), // Espacio vertical entre widgets

            // Campo de texto para el usuario
            Container(
              width: 475, // Ancho del contenedor
              child: const TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white, // Color del texto de sugerencia
                    fontSize: 20.0, // Tamaño del texto de sugerencia
                    fontWeight: FontWeight.bold, // Negrita
                  ),
                  hintText: 'Usuario', // Texto de sugerencia
                  fillColor: Colors.red, // Color de fondo del campo
                  filled: true, // Habilitar el relleno
                ),
              ),
            ),
            const SizedBox(height: 30), // Espacio vertical entre widgets

            // Campo de texto para la contraseña
            Container(
              width: 475, // Ancho del contenedor
              child: const TextField(
                obscureText: true, // Oculta el texto ingresado
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white, // Color del texto de sugerencia
                    fontSize: 20.0, // Tamaño del texto de sugerencia
                    fontWeight: FontWeight.bold, // Negrita
                  ),
                  hintText: 'Contraseña', // Texto de sugerencia
                  fillColor: Colors.red, // Color de fondo del campo
                  filled: true, // Habilitar el relleno
                ),
              ),
            ),
            const SizedBox(height: 25), // Espacio vertical entre widgets

            // Fila para los botones
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centrar los botones
              children: <Widget>[
                BotonRegistrar(context), // Botón de registro
                const SizedBox(width: 15), // Espacio horizontal entre botones
                BotonAcceder(), // Botón de acceder
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para el botón de registrar
Widget BotonRegistrar(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // Navegar a la pantalla de registro al presionar el botón
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PantallaRegistro()),
      );
    },
    child: const Text('Registrar'), // Texto del botón
  );
}

// Widget para el botón de acceder
Widget BotonAcceder() {
  return ElevatedButton(
    onPressed: () {
      // Aquí iría la lógica para acceder al usuario
    },
    child: const Text('Acceder'), // Texto del botón
  );
}
