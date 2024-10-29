import 'package:appoposiciones/login.dart';
import 'package:appoposiciones/registro.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'theme.dart'; // Importa el archivo que contiene el tema
import 'preguntas_desarrollo.dart';

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
      theme: AppTheme.lightTheme, // Aplicar el tema aquí
      /*theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 11, 0, 170)),
        useMaterial3: true,
      ),*/
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

  void initState(){
    super.initState();
    bool acceder = true;
    if (acceder == true){
      WidgetsBinding.instance.addPostFrameCallback((_){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PantallaLogin(title: 'login'),
        ),
      );
    });
  }
}

  
  @override
  Widget build(BuildContext context) {

 
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CircularProgressIndicator(), // Muestra un cargando mientras rediriges.
        ),
      );
  }
}
