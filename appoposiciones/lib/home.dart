import 'package:flutter/material.dart';
import 'package:appoposiciones/temario_temas.dart';
import 'package:appoposiciones/temario_test.dart';
import 'package:appoposiciones/estadisticas.dart';
import 'package:appoposiciones/configuracion.dart';

class Tap extends StatelessWidget {
  const Tap({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulación de tiempos de conexión
    final String tiempoPorDia = "2 horas";
    final String tiempoTotal = "50 horas";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // Icono de engranaje
            onPressed: () {
              // Navega a la página de configuración
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const Configuracion()), // Asegúrate de que esta clase esté implementada
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
                height: 20), // Espacio entre el texto y el recuadro de foto
            // Recuadro para la foto de perfil
            CircleAvatar(
              radius: 50, // Radio para el tamaño del óvalo
              backgroundColor:
                  Colors.grey[300], // Color de fondo si no hay imagen
              backgroundImage: NetworkImage(
                  'https://example.com/tu_imagen.jpg'), // URL de la imagen
            ),
            const SizedBox(height: 20), // Espacio entre la foto y el botón
            ElevatedButton(
              onPressed: () {
                // Navega a la página de Estadísticas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Estadisticas()),
                );
              },
              child: const Text("Estadísticas"),
            ),
            const SizedBox(height: 20), // Espacio entre el botón y los tiempos
            Text(
              "Tiempo de conexión por día: $tiempoPorDia",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10), // Espacio entre los textos
            Text(
              "Tiempo de conexión total: $tiempoTotal",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Temario',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Temario_Test(numeroDeTemas: 4)),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Temario_temas(numeroDeTemas: 4)),
            );
          }
        },
      ),
    );
  }
}

// Punto de entrada de la aplicación
/*void main() {
  runApp(MaterialApp(
    home: Tap(), // Inicia la aplicación con la clase Tap
  ));
}*/
