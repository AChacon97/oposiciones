import 'package:flutter/material.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos los temas y sus puntuaciones (aciertos y fallos) en un array
    final List<Map<String, dynamic>> temas = [
      {'nombre': 'Tema 1', 'aciertos': 8, 'fallos': 2},
      {'nombre': 'Tema 2', 'aciertos': 5, 'fallos': 5},
      {'nombre': 'Tema 3', 'aciertos': 9, 'fallos': 1},
      // Añade más temas según necesites
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Estadísticas"),
      ),
      body: ListView.builder(
        itemCount: temas.length,
        itemBuilder: (context, index) {
          final tema = temas[index];
          return ListTile(
            title: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centra el contenido
              children: [
                Text(
                  tema['nombre'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                    width: 10), // Espacio entre el tema y las puntuaciones
                Text(
                  '${tema['aciertos']} aciertos',
                  style: const TextStyle(color: Colors.green),
                ),
                const SizedBox(width: 5), // Espacio entre aciertos y fallos
                Text(
                  '${tema['fallos']} fallos',
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
