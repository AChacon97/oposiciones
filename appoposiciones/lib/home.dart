import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
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
  List<Map<String, dynamic>> temas = [];
  Map<String, int> temaProgressTest = {};
  Map<String, int> temaProgressDesarrollo = {};

<<<<<<< HEAD
  @override
  void initState() {
    super.initState();
    _loadTemas(); // Cargar temas en la inicialización
  }

  Future<void> _loadTemas() async {
    try {
      final String assetPath = _currentIndex == 0
          ? 'assets/preguntas_test.json'
          : 'assets/Preguntas_Desarrollo.json';

      final String response = await rootBundle.loadString(assetPath);
      final data = json.decode(response);

      setState(() {
        temas = List<Map<String, dynamic>>.from(data['temas']).map((tema) {
          return {
            'tema': tema['tema'],
            'nombre_tema': tema['nombre_tema'] ?? 'Tema sin nombre',
            'preguntas': tema['preguntas'] ?? [],
          };
        }).toList();

        final progressMap =
            _currentIndex == 0 ? temaProgressTest : temaProgressDesarrollo;
        for (var tema in temas) {
          progressMap[tema['tema']] = progressMap[tema['tema']] ?? 0;
        }
      });
    } catch (e) {
      print("Error al cargar los temas: $e");
    }
  }
=======
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
>>>>>>> antonio

  void _updateTemaProgress(String tema, int status) {
    setState(() {
      if (_currentIndex == 0) {
        temaProgressTest[tema] = status;
      } else {
        temaProgressDesarrollo[tema] = status;
      }
    });
  }

<<<<<<< HEAD
  ButtonStyle _getButtonStyle(String tema) {
=======
  final List<String> temas = [
    'Tema 1',
    'Tema 2',
    'Tema 3',
  ];

  ButtonStyle _getButtonStyle(String tema, BuildContext context) {
>>>>>>> antonio
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
<<<<<<< HEAD
          _currentIndex == 0 ? 'Preguntas Test' : 'Preguntas de Desarrollo',
        ),
      ),
      body: _currentIndex == 2
          ? Configuracion()
          : Center(
              child: temas.isEmpty
                  ? CircularProgressIndicator()
                  : ListView(
                      padding: EdgeInsets.all(16.0),
                      children: temas.map((tema) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            style: _getButtonStyle(tema['tema']),
                            onPressed: () async {
                              _updateTemaProgress(tema['tema'], 1);

                              final resultado = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => _currentIndex == 0
                                      ? Preguntas_Test(nombre: tema['tema'])
                                      : Preguntas_Desarrollo(
                                          nombre: tema['tema']),
                                ),
                              );

                              if (resultado == 'completado') {
                                _updateTemaProgress(tema['tema'], 2);
                              } else {
                                _updateTemaProgress(tema['tema'], 1);
                              }
                            },
                            child: Text(
                                "Tema ${tema['tema']}. ${tema['nombre_tema']}"),
                          ),
                        );
                      }).toList(),
                    ),
            ),
=======
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
>>>>>>> antonio
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40, // Tamaño de los iconos
        selectedFontSize: 16, // Ajuste de tamaño de texto seleccionado
        unselectedFontSize: 14, // Ajuste de tamaño de texto no seleccionado
        items: const [
          BottomNavigationBarItem(
<<<<<<< HEAD
            icon: Icon(Icons.quiz),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Temario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
=======
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
>>>>>>> antonio
            label: 'Configuración',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
<<<<<<< HEAD
            _loadTemas(); // Recargar temas al cambiar de pestaña
=======
>>>>>>> antonio
          });
        },
      ),
    );
  }

<<<<<<< HEAD
void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
=======
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
>>>>>>> antonio
