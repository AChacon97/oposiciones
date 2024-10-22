import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario

// Clase principal que representa la pantalla de estadísticas
class Estadisticas extends StatelessWidget {
  const Estadisticas({super.key}); // Constructor de la clase

  @override
  Widget build(BuildContext context) {
    // Definimos los temas y sus puntuaciones (aciertos y fallos) en una lista de mapas
    final List<Map<String, dynamic>> temas = [
      {
        'nombre': 'Tema 1',
        'aciertos': 8,
        'fallos': 2
      }, // Tema 1 con sus estadísticas
      {
        'nombre': 'Tema 2',
        'aciertos': 5,
        'fallos': 5
      }, // Tema 2 con sus estadísticas
      {
        'nombre': 'Tema 3',
        'aciertos': 9,
        'fallos': 1
      }, // Tema 3 con sus estadísticas
      // Añade más temas según necesites
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Estadísticas"), // Título de la barra de aplicación
      ),
      body: ListView.builder(
        itemCount: temas.length, // Cantidad de elementos en la lista
        itemBuilder: (context, index) {
          final tema = temas[index]; // Obtenemos el tema en el índice actual
          return ListTile(
            title: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centra el contenido del Row
              children: [
                // Nombre del tema
                Text(
                  tema['nombre'], // Muestra el nombre del tema
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold), // Estilo del texto
                ),
                const SizedBox(
                    width: 10), // Espacio entre el tema y las puntuaciones
                // Muestra los aciertos
                Text(
                  '${tema['aciertos']} aciertos', // Texto de aciertos
                  style: const TextStyle(
                      color: Colors.green), // Estilo en color verde
                ),
                const SizedBox(width: 5), // Espacio entre aciertos y fallos
                // Muestra los fallos
                Text(
                  '${tema['fallos']} fallos', // Texto de fallos
                  style: const TextStyle(
                      color: Colors.red), // Estilo en color rojo
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
