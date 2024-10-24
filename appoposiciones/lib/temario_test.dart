import 'package:appoposiciones/preguntas_test.dart';
import 'package:flutter/material.dart';
import 'Tema.dart';
import 'theme.dart'; // Importa el archivo que contiene el tema

class Temario_Test extends StatelessWidget {
  // const Temario_Test({super.key});
  final List<Tema> temas;
  const Temario_Test({super.key, required this.temas});



// JOSE esto es para que puedas crear las reglas de los colores en las card, Tema COMPLETADAS, SIN ABRIR y EMPEZADAS. En el archivo "theme" al final del todo lo tienes cada color.

 /* ExampleCard({required this.state});

  @override
  Widget build(BuildContext context) {
    CardTheme cardTheme;

    switch (state) {
      case 'success':
        cardTheme = AppTheme.cardThemeSuccess;
        break;
      case 'error':
        cardTheme = AppTheme.cardThemeError;
        break;
      default:
        cardTheme = AppTheme.cardThemeNormal;
    }
    */

    





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
                  child: ListView.builder(
                      itemCount: temas.length,
                      itemBuilder: (context, index) {
                        return _boton(context, temas[index]);
                      }),
                )
              ],
            ),
          ),
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
            0.45, // Ajusta el ancho al 45% del ancho de la pantalla
        height: 60, // Anchura y altura de la carta
        child: Card(
          //color: cardTheme.color, //      <-----------------------------------------------------Esto aplicará el esquema de color que aplique.
          margin: EdgeInsets.all(5.0), // Margen entre las cartas
          //color: const Color.fromARGB(255, 2, 244, 10), // Color de la carta
          elevation: 10.0, // Elevamos el botón
          //shadowColor: Colors.red, // Color de la sombra
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
        MaterialPageRoute(
            builder: (context) => Preguntas_Test(nombre: temas.titulo)),
      );
    },
  );
}
