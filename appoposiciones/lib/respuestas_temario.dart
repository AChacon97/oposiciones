import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para cargar el JSON

class Respuestas_Temario extends StatelessWidget {
  final String tema;

  const Respuestas_Temario({Key? key, required this.tema}) : super(key: key);

  Future<Map<String, dynamic>> cargarPreguntas() async {
    final String response = await rootBundle.loadString('assets/preguntas.json');
    return json.decode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta Aleatoria - $tema'),
      ),
      body: FutureBuilder(
        future: cargarPreguntas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('No preguntas'));
          }else if (!snapshot.hasData || snapshot.data?['preguntas'] == null) {
            return Center(child: Text('No hay preguntas disponibles'));
          } 
          else {
            final preguntas = snapshot.data!['preguntas'] as List;
            final preguntaAleatoria = (preguntas..shuffle()).first; // Selecciona una pregunta aleatoria
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    preguntaAleatoria['pregunta'],
                    style: TextStyle(fontSize: 24),
                  ),
                  _botonRespuesta(),
                  // Aquí puedes agregar lógica para mostrar las respuestas, etc.
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


Widget _botonRespuesta (){
  return ElevatedButton(
    onPressed: (){}, 
    child: Text('Respuesta'),
    );
}

