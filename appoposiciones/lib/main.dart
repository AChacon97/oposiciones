import 'package:flutter/material.dart'; //cAMBIO
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
                  fontSize: 28.0, // Tamaño de la letra.
                  fontWeight: FontWeight.bold, // La letra en negrita.
                  color: Colors.blueAccent, // Color de la letra
                  shadows: <Shadow>[
                    Shadow(
                      // Permite añadir sombras a los textos
                      offset: Offset(5.0, 10.0), // Desplazamiento de la sombra.
                      blurRadius: 3.0, // Difuminado de la sombra.
                      color: Colors.black26, // Color de la sombra
                    )
                  ],
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                // Esto es un contenedor donde recogemos el TextField de la barra, se ha creado para poder meter un width para el ancho
                width: 475,
                child: const TextField(
                  // Todo lo que conlleva la barra usuario.
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    hintText: 'Usuario',
                    fillColor: Colors.red,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                //Esto es un contenedor donde recogemos el TextField de la barra, se ha creado para poder meter un width para el ancho.
                width: 475,
                child: const TextField(
                  // Todo lo que conlleva la barra contraseña.
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                    hintText: 'Contraseña',
                    fillColor: Colors.red,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                  //fila para acoger los métodos de los botones.
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BotonRegistrar(),
                    const SizedBox(
                      width: 15,
                    ),
                    BotonAcceder(),
                  ]),
            ],
          ),
        ));
  }
}

Widget BotonRegistrar() {
  // Método para el botón registrar
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Registrar'),
  );
}

Widget BotonAcceder() {
  // Método para el botón acceder.
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Acceder'),
  );
}
