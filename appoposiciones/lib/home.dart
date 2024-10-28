<<<<<<< HEAD
import 'package:appoposiciones/temario_test.dart';
import 'package:flutter/material.dart';
import 'package:appoposiciones/temario_temas.dart';
import 'package:appoposiciones/estadisticas.dart';
import 'package:appoposiciones/configuracion.dart';
import 'Tema.dart';
import 'theme.dart';

class Tap extends StatefulWidget {
  const Tap({super.key});
=======
import 'package:flutter/material.dart';
import 'package:appoposiciones/preguntas_test.dart';
import 'package:appoposiciones/preguntas_desarrollo.dart';
import 'preguntas_desarrollo.dart';
import 'theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
>>>>>>> developed

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Mapas para almacenar el progreso de cada tema en Test y en Desarrollo
  Map<String, int> temaProgressTest = {
    'Tema 1': 0,
    'Tema 2': 0,
    'Tema 3': 0,
  };
  Map<String, int> temaProgressDesarrollo = {
    'Tema 1': 0,
    'Tema 2': 0,
    'Tema 3': 0,
  };

  // Actualiza el progreso del tema cuando el usuario ha avanzado o completado
  void _updateTemaProgress(String tema, int status) {
    setState(() {
      if (_currentIndex == 0) {
        temaProgressTest[tema] = status; // Test
      } else {
        temaProgressDesarrollo[tema] = status; // Desarrollo
      }
    });
  }

  final List<String> temas = [
    'Tema 1',
    'Tema 2',
    'Tema 3',
  ];

<<<<<<< HEAD
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
=======
  // Función para obtener el estilo del botón según el progreso del tema
  ButtonStyle _getButtonStyle(String tema, BuildContext context) {
    final progress =
        _currentIndex == 0 ? temaProgressTest : temaProgressDesarrollo;
    switch (progress[tema]) {
      case 1:
        return AppTheme.inProgressColor(context);
      case 2:
        return AppTheme.completedColor(context);
      default:
        return AppTheme.notStartedColor(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentIndex == 0 ? 'Preguntas Test' : 'Preguntas de Desarrollo',
        ), // Título de la pantalla principal
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: temas.map((tema) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                style: _getButtonStyle(tema,
                    context), // Aplica el estilo del botón según el estado del tema
                onPressed: () async {
                  _updateTemaProgress(tema,
                      1); // Cambia a "en progreso" cuando se inicia el tema

                  // Navega a la pantalla de preguntas y espera el resultado
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _currentIndex == 0
                          ? Preguntas_Test(nombre: tema)
                          : Preguntas_Desarrollo(nombre: tema),
                    ),
                  );

                  // Actualiza el progreso del tema en función del resultado
                  if (resultado == 'completado') {
                    _updateTemaProgress(
                        tema, 2); // Marca el tema como completado
                  } else {
                    _updateTemaProgress(tema, 1); // Deja el tema en progreso
                  }
                },
                child: Text(tema), // Texto del botón (nombre del tema)
              ),
            );
          }).toList(),
        ),
      ),
>>>>>>> developed
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 60,
        items: const [
<<<<<<< HEAD
          BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Test'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Temario'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
=======
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Test', // Icono y etiqueta para el test
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Temario', // Icono y etiqueta para el temario
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Cambia la vista actual en la barra de navegación
>>>>>>> developed
          });
        },
      ),
    );
  }
}

<<<<<<< HEAD
// Punto de entrada de la aplicación
void main() {
  runApp(MaterialApp(
    home: Tap(),
=======
void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
>>>>>>> developed
  ));
}
