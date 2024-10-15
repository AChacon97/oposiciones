import 'package:flutter/material.dart';

class Respuestas_Temario extends StatelessWidget {
  final String nombre;
  
  const Respuestas_Temario({super.key, required this.nombre}); /* Como vemos aquí se le pasa el parametro nombre que ya sabe el tema 
                                                            que hemos seleccionado anteriormente*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen del $nombre'),
        backgroundColor: const Color.fromARGB(255, 1, 194, 248),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 194, 248),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text('Información del $nombre',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              if (nombre == 'Tema 1')...[
                Text('INFORMACIÓN TEMA 1')
              ]else if (nombre == 'Tema 2')...[
                Text('INFORMACIÓN TEMA 2')
              ]
            ],
          ),
        ),
      ),
    );
  }
}