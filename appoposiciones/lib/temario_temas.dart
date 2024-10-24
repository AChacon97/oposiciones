import 'package:appoposiciones/Tema.dart';
import 'package:appoposiciones/respuestas_temario.dart';
import 'package:flutter/material.dart';
import 'Tema.dart';
import 'theme.dart'; // Importa el archivo que contiene el tema

class Temario_temas extends StatelessWidget {
  //const Temario_temas({super.key});
  final List<Tema> temas; // Lista de temas.
  // definimos el número de temas

  const Temario_temas({Key? key, required this.temas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temario temas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '',
              style: TextStyle(
                  color: const Color.fromARGB(255, 246, 2, 2), fontSize: 30.0),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                // Se utiliza para expandir.
                child: ListView.builder(
                  itemCount: temas.length,
                  itemBuilder: (context, index) {
                    return _boton(context, temas[index]);
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}

Widget _boton(BuildContext context, Tema temas) {
  return InkWell(
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width *
            0.95, // Ajusta el ancho al 45% del ancho de la pantalla
        height: 60, // Anchura y altura de la carta
        child: Card(
          color: Theme.of(context)
              .cardTheme
              .color, // Aplica el esquema de color del tema
          margin: EdgeInsets.all(5.0), // Margen entre las cartas
          elevation: 10.0, // Elevamos el botón
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  temas.ntema,
                  style: TextStyle(fontSize: 20), // Tamaño del texto.
                ),
                Text(
                  temas.titulo,
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Respuestas_Temario(
            tema: temas.titulo,
          ),
          // Pasamos el titulo del tema.
        ),
      );
    },
  );
}
