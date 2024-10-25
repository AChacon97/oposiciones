import 'package:appoposiciones/temario_test.dart';
import 'package:flutter/material.dart';
import 'package:appoposiciones/temario_temas.dart';
import 'package:appoposiciones/estadisticas.dart';
import 'package:appoposiciones/configuracion.dart';
import 'Tema.dart';
import 'theme.dart';

class Tap extends StatefulWidget {
  const Tap({super.key});

  @override
  State<Tap> createState() => _TapState();
}

class _TapState extends State<Tap> {
  final List<Tema> temas = [
    Tema(id: 1, titulo: 'Volante'),
    Tema(id: 2, titulo: 'Aprende'),
    Tema(id: 3, titulo: 'Rueda'),
    Tema(id: 4, titulo: 'Llanta'),
    Tema(id: 5, titulo: 'Calefacción'),
    Tema(id: 6, titulo: 'A/C'),
    Tema(id: 7, titulo: 'Luces'),
    Tema(id: 8, titulo: 'Señales'),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final String tiempoPorDia = "2 horas";
    final String tiempoTotal = "50 horas";

    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Configuracion()),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? Temario_Test(temas: temas) // Reemplaza con tu pantalla de test
          : Temario_temas(temas: temas), // Pantalla de Temario
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Test'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Temario'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// Punto de entrada de la aplicación
void main() {
  runApp(MaterialApp(
    home: Tap(),
  ));
}
