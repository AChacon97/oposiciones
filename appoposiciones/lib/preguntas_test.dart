import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'preguntas.dart';
import 'respuestas.dart';

class Preguntas_Test extends StatefulWidget {
  final String nombre;

  const Preguntas_Test({super.key, required this.nombre});

  @override
  _PreguntasTestState createState() => _PreguntasTestState();
}

class _PreguntasTestState extends State<Preguntas_Test> {
  int? _respuestaSeleccionada;
  List<Pregunta> preguntas = [];

  @override
  void initState() {
    super.initState();
    _cargarPreguntas();
  }

  Future<void> _cargarPreguntas() async {
    final String response =
        await rootBundle.loadString('assets/preguntas.json');
    final data = await json.decode(response);
    setState(() {
      preguntas =
          (data['preguntas'] as List).map((i) => Pregunta.fromJson(i)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas del ${widget.nombre}'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 75.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Cuadro con la pregunta
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 136, 145, 135),
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  preguntas.isNotEmpty ? preguntas[0].pregunta : 'Cargando...',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                  height: 90.0), // Espacio entre la pregunta y las respuestas

              // Botonera de respuestas centrada
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: preguntas.isNotEmpty
                    ? preguntas[0].respuestas.map((respuesta) {
                        return Column(
                          children: [
                            _buildRadioButton(respuesta),
                            SizedBox(height: 45.0), // Espacio entre respuestas
                          ],
                        );
                      }).toList()
                    : [],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_respuestaSeleccionada != null) {
                    print(
                        'Respuesta seleccionada: ${preguntas[0].respuestas[_respuestaSeleccionada!].texto}');
                  }
                },
                child: Text('Enviar Respuesta'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioButton(Respuesta respuesta) {
    int index = preguntas[0].respuestas.indexOf(respuesta);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<int>(
          value: index,
          groupValue: _respuestaSeleccionada,
          onChanged: (value) {
            setState(() {
              _respuestaSeleccionada = value;
            });
          },
        ),
        Text(
          respuesta.texto,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
