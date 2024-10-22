import 'package:appoposiciones/temario_temas.dart';
import 'package:appoposiciones/temario_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Tema.dart';
import 'dart:convert';


// Clase principal que representa la pantalla con la barra de navegación
class Tap extends StatefulWidget {
  @override
 _TapState createState()=>_TapState();
}



class _TapState extends State<Tap>{  // Permite mantener el estado de la pantalla. Esto es esencial para que la interfaz de usuario pueda reaccionar a cambios en los datos, como la carga de los temas.
  List<Tema> temas = [];

  @override
  void initState(){
    super.initState();
    cargarTemas();
  
}

  Future<void> cargarTemas() async {
    try{
    // Cargar el archivo JSON
    // El await sirve para que decirle que la ejecución debe esperar hasta que se complete la opertación asincrona.
    //rooBundle: Permite acceder al archivo JSON.
    //loadString: Se utiliza para cargar un archivo de texto (como un JSON) y devolver el contenido como una cadena (String).
    final String response = await rootBundle.loadString('assets/temas.json');
    //json.decode(reponse): El json es una biblioteca para trabajar con datos en formato JSON y el método con decode se utiliza para convertir una cadena JSON en un objeto de Dart. En este caso toma la cadena response, que contiene el contenido del archivo JSON y la convierte en un objeto DART
    final data = json.decode(response);
    // Convertir la lista de temas
    setState(() {  // Al utilizar el setState notifica a Flutter que el estado ha cambiado, es decir, que la lista de temas ha sido actualizada.
      temas = (data['temas'] as List)  // Accedes a la parte del JSON que tiene la lista de temas. y le dices con as List que el contenido es una lista.
          .map((temaJson) => Tema.fromJson(temaJson)) //El temaJson dentro del parentesis de map: es cada elemento de la lista. 
          .toList();
    });
    print("Temas cargados: $temas");
    }catch (e){
      print("Error al cargar temas: $e");
    }
  }

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
            MaterialPageRoute(builder: (context)=>Temario_Test(numeroDeTemas: 4),),
          ); // Navegar a la pantalla de Test
          } else if (index == 1) {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=>Temario_temas(temas: temas),),
          ); // Navegar a la pantalla de Temario
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
