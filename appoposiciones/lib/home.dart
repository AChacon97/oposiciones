import 'package:flutter/material.dart';
import 'package:appoposiciones/preguntas_test.dart';
import 'package:appoposiciones/preguntas_desarrollo.dart';
import 'theme.dart';
import 'configuracion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

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

  void _updateTemaProgress(String tema, int status) {
    setState(() {
      if (_currentIndex == 0) {
        temaProgressTest[tema] = status;
      } else {
        temaProgressDesarrollo[tema] = status;
      }
    });
  }

  final List<String> temas = [
    'Tema 1',
    'Tema 2',
    'Tema 3',
  ];

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
          _currentIndex == 0
              ? 'Preguntas Test'
              : _currentIndex == 1
                  ? 'Preguntas de Desarrollo'
                  : 'Configuración',
        ),
      ),
      body: _currentIndex == 0
          ? _buildTemasScreen(context)
          : _currentIndex == 1
              ? _buildTemasScreen(context)
              : Configuracion(),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40, // Tamaño de los iconos
        selectedFontSize: 16, // Ajuste de tamaño de texto seleccionado
        unselectedFontSize: 14, // Ajuste de tamaño de texto no seleccionado
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0), // Ajuste de espaciado superior
              child: Icon(Icons.quiz),
            ),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.book),
            ),
            label: 'Temario',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.settings),
            ),
            label: 'Configuración',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildTemasScreen(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: temas.map((tema) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              style: _getButtonStyle(tema, context),
              onPressed: () async {
                _updateTemaProgress(tema, 1);

                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _currentIndex == 0
                        ? Preguntas_Test(nombre: tema)
                        : Preguntas_Desarrollo(nombre: tema),
                  ),
                );

                if (resultado == 'completado') {
                  _updateTemaProgress(tema, 2);
                } else {
                  _updateTemaProgress(tema, 1);
                }
              },
              child: Text(tema),
            ),
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
));
}