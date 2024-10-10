import 'package:flutter/material.dart';
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
        title: Text('PROYECTO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children:<Widget> [
            Text('BIENVENIDOS A TU APP DE AUTOESCUELA'),
            SizedBox(height: 30,),
            TextField(
              
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
                hintText: 'Usuario',
                fillColor: Colors.red,
                filled: true,
                
              ),
            ),
            SizedBox(height: 30,),
            TextField(
              obscureText: true,
              decoration: InputDecoration
              (
              hintStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
              hintText: 'Contraseña',
              fillColor: Colors.red,
              filled: true,
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [

                BotonRegistrar(),
                SizedBox(width: 15,),
                BotonAcceder(),
            ]
           ),
         ],
        ),
      )
    );
  }
}

Widget BotonRegistrar (){
   return ElevatedButton(
    onPressed: (){}, 
    child: Text('Registrar'),
    );
}

Widget BotonAcceder (){
  return ElevatedButton(
    onPressed: (){},
    child: Text('Acceder'),
    );
}
