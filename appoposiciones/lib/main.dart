import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Clase Tap que representa la pantalla a la que navegarás
class Tap extends StatelessWidget {
  const Tap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: const Text("Contenido aquí"), // Puedes colocar tu contenido aquí
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Temario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Test',
          ),
        ],
        currentIndex: 0, // Índice del ítem seleccionado
        selectedItemColor: Colors.blue, // Color del ítem seleccionado
        onTap: (index) {
          // Manejo de la navegación al tocar un ítem
          if (index == 0) {
            // Navegar a la pantalla de Temario
          } else if (index == 1) {
            // Navegar a la pantalla de Test
          }
        },
      ),
    );
  }
}

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('PROYECTO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
              "assets/images/Imagen de WhatsApp 2024-09-29 a las 14.01.40_25073ee1 - copia.jpg",
              height: 100,
              width: 150,
            ),
            const Text(
              'BIENVENIDOS A TU APP DE AUTOESCUELA',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(5.0, 10.0),
                    blurRadius: 3.0,
                    color: Colors.black26,
                  ),
                ],
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 475,
              child: const TextField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Usuario',
                  fillColor: Colors.red,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 475,
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  hintText: 'Contraseña',
                  fillColor: Colors.red,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BotonRegistrar(),
                const SizedBox(width: 15),
                BotonAcceder(context), // Aquí se pasa el contexto
              ],
            ),
            const SizedBox(height: 25),
            BotonIrATap(context), // Botón para ir a Tap
          ],
        ),
      ),
    );
  }
}

// Botón para ir a la pantalla Tap
Widget BotonIrATap(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Tap()),
      );
    },
    child: const Text('Ir a Tap'),
  );
}

Widget BotonRegistrar() {
  return ElevatedButton(
    onPressed: () {
      // Lógica para registrar
    },
    child: const Text('Registrar'),
  );
}

// Botón para acceder
Widget BotonAcceder(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // Aquí puedes implementar la lógica para "Acceder"
    },
    child: const Text('Acceder'),
  );
}
