import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para cargar el JSON
import 'theme.dart';

class Respuestas_Temario extends StatefulWidget {
  final String tema;

  const Respuestas_Temario({Key? key, required this.tema}) : super(key: key);

  @override
  State<Respuestas_Temario> createState() => _Respuestas_TemarioState();
}

class _Respuestas_TemarioState extends State<Respuestas_Temario> {
  String? respuestaCorrecta;
  List<dynamic> preguntas = [];
  List<dynamic> respuestas = [];
  int indicePregunta = 0; // Índice de la pregunta actual.

  Future<void> cargarDatos() async {
    // Cargar las preguntas
    final String preguntasResponse = await rootBundle.loadString('assets/preguntas.json');
    preguntas = json.decode(preguntasResponse)['preguntas'];

    // Cargar las respuestas
    final String respuestasReponse = await rootBundle.loadString('assets/respuestas.json');
    respuestas = json.decode(respuestasReponse)['respuestas'];

    setState(() {}); // Actualizar la interfaz después de cargar
    
  }

  @override
  void initState (){
    super.initState();
    cargarDatos(); // Cargar datos al iniciar.
  }
  void mostrarRespuestaCorrecta (){
    // Mostrar la respuesta correcta para la pregunta actual.
    final respuestaActual = respuestas[indicePregunta]['respuestas'].firstWhere((respuesta) => respuesta ['id'] == respuestas[indicePregunta]['correcta']);
    setState(() {
      respuestaCorrecta = respuestaActual['respuesta'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregunta Aleatoria - ${widget.tema}'),
      ),
      body: preguntas.isEmpty || respuestas.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                preguntas[indicePregunta]['pregunta'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              _botonRespuesta(mostrarRespuestaCorrecta), // Pasar la función aquí
              if (respuestaCorrecta != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Respuesta correcta: $respuestaCorrecta',
                    style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    ),
                  ),
                  _botonPasar(), // Llamar al botón para pasar
              
       
        ],
      )
    );
  }
}

Widget _botonRespuesta(VoidCallback onPressed) {
  return ElevatedButton(
    style: AppTheme.botonFuncional(),
    onPressed: onPressed, 
    child: Text('Mostrar respuesta correcta'),
  );
}

Widget _botonPasar (){
  return ElevatedButton(
    style: AppTheme.botonFuncional(),
    onPressed: (){},
    child: Text('Siguiente pregunta'),
  );
}
