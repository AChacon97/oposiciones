import 'package:flutter/material.dart';

class Estadisticas extends StatelessWidget {
  const Estadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    // Aquí defines los temas y sus puntuaciones (aciertos y fallos)
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tema['nombre']),
                Row(
                  children: [
                    Text(
                      '${tema['aciertos']} aciertos',
                      style: TextStyle(color: Colors.green),
                    ),
                    const SizedBox(
                        width: 10), // Espacio entre aciertos y fallos
                    Text(
                      '${tema['fallos']} fallos',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
