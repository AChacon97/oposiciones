import 'package:appoposiciones/preguntas_test.dart';
import 'package:flutter/material.dart';

class Temario_Test extends StatelessWidget {
 // const Temario_Test({super.key});
  final int numeroDeTemas;
   const Temario_Test({super.key, required this.numeroDeTemas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
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
                child: Text('TEMAS',style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ],
            ),
              for(int i =0; i<numeroDeTemas; i+=2)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _boton(context, 'Tema ${i+1}'),  // tema 1,3,5, etc.
                    if (i + 1 < numeroDeTemas)
                      _boton(context, 'Tema ${i+2}'), // Tema 2,4,6, etc.
                  ],
                )
           /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton(context, 'Tema 1'),
                _boton(context, 'Tema 2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton(context, 'Tema 3'),
                _boton(context, 'Tema 4'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton(context, 'Tema 5'),
                _boton(context, 'Tema 6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton(context, 'Tema 7'),
                _boton(context, 'Tema 8'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _boton(context, 'Tema 9'),
                _boton(context, 'Tema 10'),
              ],
            ),*/
          ],
        ),
        )
        
      ),
    );
  }
}

Widget _boton (BuildContext context, String nombre){
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
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => Preguntas_Test(nombre: nombre)),
        );
    },
  );
}