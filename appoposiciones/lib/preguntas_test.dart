import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'dart:math'; // Import para selección aleatoria

class Preguntas_Test extends StatefulWidget {
  final String nombre;

  const Preguntas_Test({super.key, required this.nombre});

  @override
  _PreguntasTestState createState() => _PreguntasTestState();
}

class _PreguntasTestState extends State<Preguntas_Test> {
  int? _respuestaSeleccionada;
  Map<String, dynamic>? preguntaActual; // Almacena la pregunta actual
  List<Map<String, dynamic>> preguntasTema =
      []; // Todas las preguntas en el tema
  Set<int> preguntasVistas = {}; // Seguimiento de preguntas vistas por índice
  bool respuestaComprobada = false;
  bool esCorrecto = false;
  int correctas = 0;
  int incorrectas = 0;

  @override
  void initState() {
    super.initState();
    _cargarPreguntas();
  }

  Future<void> _cargarPreguntas() async {
    final String response =
        await rootBundle.loadString('assets/preguntas_test.json');
    final data = json.decode(response);

    final temaNumero =
        int.tryParse(widget.nombre.replaceAll("Tema ", "")) ?? -1;
    print('Buscando preguntas para el tema número: $temaNumero');

    final preguntas = data['temas'].firstWhere(
      (tema) => int.tryParse(tema['tema'].toString()) == temaNumero,
      orElse: () => null,
    )?['preguntas'];

    if (preguntas != null && preguntas.isNotEmpty) {
      setState(() {
        preguntasTema = List<Map<String, dynamic>>.from(preguntas);
        _siguientePregunta(); // Carga la primera pregunta
      });
    } else {
      setState(() {
        preguntaActual = null;
        respuestaComprobada = false;
      });
    }
  }

  void _siguientePregunta() {
    if (preguntasVistas.length == preguntasTema.length) {
      _mostrarResumen();
      return;
    }

    setState(() {
      // Selecciona una nueva pregunta que no se haya visto
      int index;
      do {
        index = Random().nextInt(preguntasTema.length);
      } while (preguntasVistas.contains(index));

      preguntasVistas.add(index);
      preguntaActual = preguntasTema[index];
      respuestaComprobada = false;
      _respuestaSeleccionada = null;
    });
  }

  void _mostrarResumen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Resumen del Tema ${widget.nombre}"),
          content: Text("Correctas: $correctas\nIncorrectas: $incorrectas"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                Navigator.of(context)
                    .pop("completado"); // Vuelve al menú e indica "completado"
              },
              child: Text("Volver al Menú"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas del  ${widget.nombre}'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (preguntaActual != null)
              Text(
                preguntaActual!['pregunta'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center, // Centrado de la pregunta
              )
            else
              Text(
                'No se encontraron preguntas para este tema.',
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30.0),

            // Mostrar opciones de respuesta como botones
            if (preguntaActual != null)
              ...preguntaActual!['opciones'].map<Widget>((opcion) {
                int index = preguntaActual!['opciones'].indexOf(opcion);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0), // Aumentar la separación
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width *
                          0.9, // 90% del ancho
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        onPressed: () {
                          setState(() {
                            _respuestaSeleccionada = index;
                          });
                        },
                        child: Text(
                          opcion,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),

            const SizedBox(height: 40.0),

            // Botón para comprobar la respuesta
            if (!respuestaComprobada && preguntaActual != null)
              ElevatedButton(
                onPressed: _respuestaSeleccionada != null
                    ? () {
                        setState(() {
                          respuestaComprobada = true;
                          esCorrecto = preguntaActual!['opciones']
                                  [_respuestaSeleccionada!] ==
                              preguntaActual!['respuesta_correcta'];
                          if (esCorrecto) {
                            correctas++;
                          } else {
                            incorrectas++;
                          }
                        });
                      }
                    : null, // Deshabilitar si no se selecciona ninguna respuesta
                child: Text('Comprobar Respuesta'),
              ),

            // Mostrar si la respuesta es correcta o no
            if (respuestaComprobada)
              Column(
                children: [
                  Text(
                    esCorrecto ? '¡Correcto!' : 'Incorrecto, intenta de nuevo.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: esCorrecto ? Colors.green : Colors.red,
                    ),
                    textAlign: TextAlign.center, // Centrado del mensaje
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _siguientePregunta,
                    child: Text('Siguiente Pregunta'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
