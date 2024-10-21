import 'package:appoposiciones/login.dart';
import 'package:appoposiciones/registro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'theme.dart'; // Importa el archivo que contiene el tema

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
  void initState() {
    // Mostrar el diálogo automáticamente cuando la pantalla se inicia
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      /* El WidgetsBinding es la clase que se encarga de la interacción entre el framework de flutter y el motor de renderizado.*/
      // El addPostFrameCallBack((_) {...}) : Asegura que el código dentro del callback se ejecute justo después de que se haya completado el dibijo de la interfaz de usuario.
      // El _showMyDialog(); : Dentro del callback, se llama a la función _showMyDialog(), que muestra dialogo.
      _showMyDialog();
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // El usuario no puede cerrar el diálogo tocando fuera
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bienvenido'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Hola. Si no estás registrado, resgistrate. Si de lo contrario estás registrado, accede pulsando en login'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('registro'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PantallaRegistro())); // Cerrar el diálogo
              },
            ),
            TextButton(
              child: Text('login'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PantallaLogin(title: 'login')));
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pantalla principal'),
          ],
        ),
      ),
    );
  }
}
