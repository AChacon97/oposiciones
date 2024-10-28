import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Preguntas_Desarrollo extends StatefulWidget {
  final String nombre;
  const Preguntas_Desarrollo({Key? key, required this.nombre})
      : super(key: key);

  @override
  _Preguntas_DesarrolloState createState() => _Preguntas_DesarrolloState();
}

class _Preguntas_DesarrolloState extends State<Preguntas_Desarrollo> {
  List<dynamic> preguntas = [];
  int preguntaActual = 0;
  bool mostrarRespuesta = false;

  @override
  void initState() {
    super.initState();
    _cargarPreguntas();
  }

  // Cargar preguntas desde el archivo JSON
  Future<void> _cargarPreguntas() async {
    final String response =
        await rootBundle.loadString('assets/Preguntas_Desarrollo.json');
    print(response); // Imprime el contenido del JSON
    final data = json.decode(response);

    setState(() {
      // Filtrar las preguntas por el tema seleccionado
      preguntas = data['temas'].firstWhere((tema) =>
          tema['tema'] == widget.nombre.replaceAll('Tema ', ''))['preguntas'];
    });
  }

  // Función para avanzar a la siguiente pregunta
  void _siguientePregunta() {
    setState(() {
      if (preguntaActual < preguntas.length - 1) {
        preguntaActual++;
        mostrarRespuesta = false;
      } else {
        // Muestra un resumen si no hay más preguntas
        _mostrarResumen();
      }
    });
  }

  // Mostrar el resumen al final de las preguntas
  void _mostrarResumen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fin del Tema"),
          content:
              Text("Has terminado todas las preguntas de ${widget.nombre}."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(
                    'completado'); // Vuelve a la pantalla de temas y marca como completado
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
    if (preguntas.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.nombre),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final pregunta = preguntas[preguntaActual];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Pregunta ${preguntaActual + 1}: ${pregunta['pregunta']}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  mostrarRespuesta = !mostrarRespuesta;
                });
              },
              child: Text(
                  mostrarRespuesta ? "Ocultar Respuesta" : "Ver Respuesta"),
            ),
            if (mostrarRespuesta) ...[
              SizedBox(height: 10),
              Text(
                "Respuesta: ${pregunta['respuesta']}",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ],
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _siguientePregunta,
              child: Text("Siguiente Pregunta"),
            ),
          ],
        ),
      ),
    );
  }
}
