

import 'package:appoposiciones/preguntas_test.dart';
import 'package:flutter/material.dart';
import 'Tema.dart';

class Temario_Test extends StatelessWidget {
 // const Temario_Test({super.key});
  final List<Tema>temas;
   const Temario_Test({super.key, required this.temas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('',
              style: TextStyle(color: const Color.fromARGB(255, 246, 2, 2), fontSize: 30.0),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: temas.length,
                    itemBuilder: (context, index){
                      return _boton(context, temas [index]);
                    }
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _boton (BuildContext context, Tema temas){
  return InkWell(
    child: Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45, // Ajusta el ancho al 45% del ancho de la pantalla
        height: 60,                                // Anchura y altura de la carta
        child: Card(
          margin: EdgeInsets.all(5.0),                      // Margen entre las cartas
          color: const Color.fromARGB(255, 2, 244, 10),  // Color de la carta
          elevation: 10.0,                                // Elevamos el botón
          shadowColor: Colors.red,                     // Color de la sombra
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
              ),
            ],
          ),
        ),
      ),
    ),
  ),
    onTap: () {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => Preguntas_Test(nombre:temas.titulo)),
        );
    },
  );
}
