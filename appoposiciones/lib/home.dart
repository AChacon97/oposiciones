import 'package:flutter/material.dart';

// Clase principal que representa la pantalla con la barra de navegación
class Tap extends StatelessWidget {
  const Tap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de aplicación en la parte superior
      appBar: AppBar(
        title: const Text("Home"), // Título de la aplicación
      ),
      // Cuerpo de la pantalla
      body: Center(
        child:
            Text("Como runea como runea"), // Puedes colocar tu contenido aquí
      ),
      // Barra de navegación en la parte inferior
      bottomNavigationBar: BottomNavigationBar(
        // Lista de ítems en la barra de navegación
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz), // Ícono para "Test"
            label: 'Test', // Etiqueta para "Test"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Ícono para "Temario"
            label: 'Temario', // Etiqueta para "Temario"
          ),
        ],
        currentIndex: 0, // Índice del ítem seleccionado
        selectedItemColor: Colors.blue, // Color del ítem seleccionado
        onTap: (index) {
         
          // Manejo de la navegación cuando se toca un ítem
          // Puedes utilizar Navigator para cambiar de pantalla aquí
          if (index == 0) {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>(Temario_Test))
          ) // Navegar a la pantalla de Test
          } else if (index == 1) {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>(Temario_temas))
          ) // Navegar a la pantalla de Temario
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
