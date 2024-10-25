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
  double valoracionDificultad = 5;

  Future<void> cargarDatos() async {
    // Cargar las preguntas

    final String preguntasResponse = await rootBundle.loadString('assets/preguntas.json'); // 
    preguntas = json.decode(preguntasResponse)['preguntas']; // Conviertes la cadena de texto JSON a un objeto en Dart. El ['preguntas'] se riefere al nombre de la lista del documento JSON.
    

    // Cargar las respuestas
    final String respuestasReponse = await rootBundle.loadString('assets/respuestas.json');
    respuestas = json.decode(respuestasReponse); // Conviertes la cadena de texto JSON a un objeto en Dart.

    //Generar una pregunta aleatoria al cargar
    if (preguntas.isNotEmpty){
      indicePregunta = (DateTime.now().millisecondsSinceEpoch % preguntas.length).toInt();
      /* Con esto DateTime.now().millisecondsSinceEpoch % conseguimos un número aleatorio entre 0 y preguntas.length */
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
     
    final preguntaActual = preguntas[indicePregunta]; // Quieres coger el indicePreguntas que anteriormente es un número aleatorio. Ese numero lo tiene ya en la lista preguntas y se guarda en preguntasActual.
    final preguntaID = preguntaActual['id']; // Como ya tenemos el numero aleatorio de la lista preguntas en preguntaActual pues ahora utilizamos ese número para ir al 'id' del archivo JSON de preguntas y así saber que pregunta es.

    // Buscar la respuesta correcta basada en el ID de la pregunta.

    final respuestaActual = respuestas.firstWhere( // Revisa cada elemento de la lista respuestas y busca el primer elemento que cumpla con una condición especifica.
      (respuesta)=> respuesta['preguntaId'] == preguntaID, /* (respuesta): Es el nombre que se le da a cada elemento de esa lista mientras se está revisando uno por uno
                                                               respuesta es un nombre temporar que se usa para refereirse a cada elemento en la lista mientras se busca
                                                               Esta parte es una función que toma cada respuesta de la lista y verifica si su preguntaId es igual al preguntaID que tienes.
                                                               
                                                               EN CONCLUSION: La función busca en la lista respuestas la primera respuesta cuyo preguntaId coincida con preguntaID. Si encuentra una coincidencia, la guarda en la variable respuestaActual. Si no encuentra ninguna coincidencia, respuestaActual será null. */
       orElse: () => null,// Si encuentra un elemento que cumple con la condición, lo devuelve; si no, ejecuta el bloque orElse.
    );
    if (respuestaActual != null){
      final correcta = respuestaActual['correcta'];
      respuestaCorrecta = respuestaActual['respuestas'].firstWhere( //Si se encuentra una respuesta válida, obtiene el ID de la respuesta correcta y la busca en la lista. 
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
    indicePregunta = (DateTime.now().millisecondsSinceEpoch % preguntas.length).toInt(); // Genera otra pregunta aleatoria y reinicia respuestaCorrecta.
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
                  SizedBox(height: 30,),
                  _botonPasar(siguientePregunta), // Llamar al botón para pasar
                  
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Column(
                      children: [
                        Text('¿Cómo ha sido de dificil?'),
                        Slider(
                          value: valoracionDificultad,
                          min: 1,
                          max: 10,
                          divisions: 9,  // Lo partimos en 9 puntos para seleccionar
                          label: valoracionDificultad.round().toString(), /* Se utiliza para mostrar una etiqueta en el Slider que indica el valor actual seleccionado por el usuario.
                                                                             El .round() sirve para rendondear al entero mas cercano.
                                                                             El toString convierte el tipo entero a String porque el label tiene que recibir un tipo de dato String para mostrarlo.*/
                          
                          /*se utiliza para manejar el evento cuando el usuario mueve el Slider. 
                            onChanged: Esta propiedad se activa cada vez que el usuario mueve el Slider.
                            (double nuevoValor): Esta es la función anónima que recibe un parámetro llamado nuevoValor, que representa el nuevo valor del Slider cuando se ajusta.  */
                          onChanged: (double nuevoValor){
                            setState(() {
                              valoracionDificultad = nuevoValor;
                            });
                          },
                        ),
                        Text('Valoración: ${valoracionDificultad.round()}'),
                    
                      ],
                    ),
                  )
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
