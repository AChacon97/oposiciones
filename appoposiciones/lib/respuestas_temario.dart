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
  int indicePregunta = -1; // Índice de la pregunta actual. (Inicialmente  no hay preguntas)

  Future<void> cargarDatos() async {
    // Cargar las preguntas

    final String preguntasResponse = await rootBundle.loadString('assets/preguntas.json');
    preguntas = json.decode(preguntasResponse)['preguntas'];
    

    // Cargar las respuestas
    final String respuestasReponse = await rootBundle.loadString('assets/respuestas.json');
    respuestas = json.decode(respuestasReponse);

    //Generar una pregunta aleatoria al cargar
    if (preguntas.isNotEmpty){
      indicePregunta = (DateTime.now().millisecondsSinceEpoch % preguntas.length).toInt();
    }

    setState(() {}); // Actualizar la interfaz después de cargar
    
  }

  @override
  void initState (){
    super.initState();
    cargarDatos(); // Cargar datos al iniciar.
  }
  void mostrarRespuestaCorrecta (){
    
    if (indicePregunta >= 0 && indicePregunta < respuestas.length){
      //Obtener el ID de la pregunta actual
     
    final preguntaActual = preguntas[indicePregunta];
    final preguntaID = preguntaActual['id'];

    // Buscar la respuesta correcta basada en el ID de la pregunta.

    final respuestaActual = respuestas.firstWhere(
      (respuesta)=> respuesta['preguntaId'] == preguntaID,
       orElse: () => null,
    );
    if (respuestaActual != null){
      final correcta = respuestaActual['correcta'];
      respuestaCorrecta = respuestaActual['respuestas'].firstWhere(
        (respuesta) => respuesta['id'] == correcta,
         orElse: () => null,
      )?['respuesta']?? 'Respuesta no encontrada';
    }
    setState(() {}); // Actualizar la interfaz para mostrar la respuesta correcta.
  }
}
void siguientePregunta(){
  setState(() {
    // Generar un índice aleatorio
    indicePregunta = (DateTime.now().millisecondsSinceEpoch % preguntas.length).toInt();
    respuestaCorrecta = null; // Reiniciar la respuesta correcta.
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
                preguntas[indicePregunta]['pregunta'], // Muestra la pregunta
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
                  _botonPasar(siguientePregunta), // Llamar al botón para pasar
              
        
        ],
      ),
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

Widget _botonPasar (VoidCallback onPressed){
  return ElevatedButton(
    style: AppTheme.botonFuncional(),
    onPressed: onPressed,
    child: Text('Siguiente pregunta'),
  );
}
