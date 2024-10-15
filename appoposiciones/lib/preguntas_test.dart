import 'package:flutter/material.dart';

class PreguntasTest extends StatelessWidget {
  final String nombre;

  const PreguntasTest({super.key, required this.nombre}); /* Como vemos aquí se le pasa el parametro nombre que ya sabe el tema 
                                                            que hemos seleccionado anteriormente*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas del $nombre'),
        backgroundColor: const Color.fromARGB(255, 1, 194, 248),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 194, 248),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Preguntas del $nombre:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Aquí puedes agregar las preguntas específicas para cada tema
            if (nombre == 'Tema 1') ...[  // Se utilizan corchetes en lugar de llaves porque son como listas de widgets y el operador ... se utiliza para insertar todos los elementos de la lista 
              Text('Pregunta 1 del Tema 1'),
              Text('Pregunta 2 del Tema 1'),
              Text('Pregunta 3 del Tema 1'),
            ] else if (nombre == 'Tema 2') ...[
              Text('Pregunta 1 del Tema 2'),
              Text('Pregunta 2 del Tema 2'),
              Text('Pregunta 3 del Tema 2'),
            ]
            // Agrega más preguntas para otros temas de manera similar
          ],
        ),
      ),
    );
  }
}