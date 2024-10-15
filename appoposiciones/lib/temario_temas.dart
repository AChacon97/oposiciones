import 'package:flutter/material.dart';

class Temario_temas extends StatelessWidget {
  const Temario_temas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temario temas'),
        backgroundColor: const Color.fromARGB(255, 1, 194, 248),
      ),
      backgroundColor: const Color.fromARGB(255, 1, 194, 248),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(20.0),
                child: Text('TEMAS',style: TextStyle(color: Colors.white, fontSize: 30.0),),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton('Tema 1'),
                _boton('Tema 2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton('Tema 3'),
                _boton('Tema 4'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton('Tema 5'),
                _boton('Tema 6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton('Tema 7'),
                _boton('Tema 8'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton('Tema 9'),
                _boton('Tema 10'),
              ],
            ),
          ],
        ),
        )
        
      ),
    );
  }
}

Widget _boton (String nombre){
  return InkWell(
    child: Container(
      width: 70, height: 70,                                // Anchura y altura de la carta
      child: Card(
        margin: EdgeInsets.all(5.0),                      // Margen entre las cartas
        color: const Color.fromARGB(255, 2, 244, 10),  // Color de la carta
        elevation: 10.0,                                // Elevamos el botón
        shadowColor: Colors.red,                     // Color de la sombra
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nombre),
          ],
        )
      ),
    ),
    onTap: () {
      
    },
  );
}