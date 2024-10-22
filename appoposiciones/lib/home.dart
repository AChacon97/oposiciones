import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'package:appoposiciones/temario_temas.dart'; // Importa la clase para el temario de temas
import 'package:appoposiciones/temario_test.dart'; // Importa la clase para el temario de tests
import 'package:appoposiciones/estadisticas.dart'; // Importa la clase de estadísticas
import 'package:appoposiciones/configuracion.dart'; // Importa la clase de configuración

// Clase principal que representa la pantalla de inicio
class Tap extends StatelessWidget {
  const Tap({super.key}); // Constructor de la clase

  @override
  Widget build(BuildContext context) {
    // Simulación de tiempos de conexión
    final String tiempoPorDia =
        "2 horas"; // Tiempo promedio de conexión por día
    final String tiempoTotal = "50 horas"; // Tiempo total de conexión

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"), // Título de la barra de aplicación
        actions: [
          IconButton(
            icon: const Icon(
                Icons.settings), // Icono de engranaje para configuración
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
          mainAxisAlignment: MainAxisAlignment
              .center, // Centra los elementos en el eje vertical
          children: [
            const SizedBox(
                height: 20), // Espacio entre el texto y el recuadro de foto
            // Recuadro para la foto de perfil
            CircleAvatar(
              radius: 50, // Radio para el tamaño del círculo
              backgroundColor:
                  Colors.grey[300], // Color de fondo si no hay imagen
              backgroundImage: NetworkImage(
                  'https://example.com/tu_imagen.jpg'), // URL de la imagen del perfil
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
              child: const Text("Estadísticas"), // Texto del botón
            ),
            const SizedBox(height: 20), // Espacio entre el botón y los tiempos
            Text(
              "Tiempo de conexión por día: $tiempoPorDia", // Muestra el tiempo de conexión diario
              style: const TextStyle(fontSize: 16), // Estilo del texto
            ),
            const SizedBox(height: 10), // Espacio entre los textos
            Text(
              "Tiempo de conexión total: $tiempoTotal", // Muestra el tiempo total de conexión
              style: const TextStyle(fontSize: 16), // Estilo del texto
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz), // Icono para la sección de tests
            label: 'Test', // Etiqueta para la sección de tests
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Icono para la sección de temario
            label: 'Temario', // Etiqueta para la sección de temario
          ),
        ],
        currentIndex: 0, // Índice del elemento seleccionado
        selectedItemColor: Colors.blue, // Color del ítem seleccionado
        onTap: (index) {
          // Función que se ejecuta al tocar un ítem
          if (index == 0) {
            // Si se toca el primer ítem (Test)
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Temario_Test(
                      numeroDeTemas: 4)), // Navega al temario de tests
            );
          } else if (index == 1) {
            // Si se toca el segundo ítem (Temario)
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Temario_temas(
                      numeroDeTemas: 4)), // Navega al temario de temas
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
