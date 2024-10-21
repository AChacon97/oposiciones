
import 'package:appoposiciones/Tema.dart';
import 'package:appoposiciones/respuestas_temario.dart';
import 'package:flutter/material.dart';


class Temario_temas extends StatelessWidget {
 //const Temario_temas({super.key});
  final List<Tema> temas; // Lista de temas.
    // definimos el número de temas 
  
  const Temario_temas({Key? key, required this.temas}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    List<Tema> temasPares = temas.where((tema) => tema.id % 2 == 0).toList();
    List<Tema> temasImpares = temas.where((tema) => tema.id % 2 != 0).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Temario temas'),
        
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'TEMAS',
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(   // Se utiliza para expandir.
                  child:ListView.builder(
                    itemCount: temasImpares.length,
                    itemBuilder: (context, index) {
                     return _boton(context, temasImpares[index]);
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: temasPares.length,
                        itemBuilder: (context, index){
                          return _boton(context, temasPares[index]);
                        },
                      ) 
                    ),
                  ],
                ) 
              ),
            ],
          ),
        );
      }
    }

Widget _boton (BuildContext context,  Tema temas){
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
        MaterialPageRoute(builder: (context) => Respuestas_Temario(nombre: temas.titulo, ),
         // Pasamos el titulo del tema.
        ),
      );
    },
  );
}

