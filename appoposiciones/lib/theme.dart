import 'package:flutter/material.dart';

const String fontFamily = 'Times New Roman';

class AppTheme {
  // Paleta de colores
  static const Color primaryColor = Color(0xFF6200EA); // Morado
  static const Color secondaryColor =
      Color.fromARGB(255, 209, 225, 224); // Verde aguamarina

  // Colores FONDO BOTONES TEMAS
  static const Color fodoCompletado = Color(0xFF388E3C); // fondo TEMA COMPLETO
  static const Color fondoEmpezado = Color(0xFFFFC107); // fondo TEMA EMPEZADO
  static const Color FondoNoCompletado =
      Color.fromARGB(255, 255, 255, 255); // Fondo TEMA sin EMPEZAR

  // Colores TEXTO BOTONES TEMAS
  static const Color textCompletado =
      Color.fromRGBO(32, 98, 35, 1); // Letras texto TEMA COMPLETO
  static const Color textEmpezado =
      Color(0xFF6D4C41); // Letras texto TEMA EMPEZADO
  static const Color textNoAbierto =
      Colors.black; // Letras texto TEMA sin EMPEZAR

  // Colores para respuesta correcta e incorrecta.
  static const Color respuestaCorecta = Color(0xFF4CAF50); // Verde
  static const Color respuestaIncorrecta = Color(0xFFD32F2F); // Rojo oscuro

  // Colores para Fondo cuadros de diálogo.
  static const Color fondoCuadroTexto =
      Color.fromARGB(255, 109, 172, 217); // Fondo casillas a RELLENAR
  static const Color fondoBotonFuncional =
      Color.fromARGB(255, 65, 91, 241); // Fondo Botón Funcionales (No de TEMAS)

  // Define un ThemeData para usar en toda la app
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(              //<--- Configuración del TEXTO.
      bodyLarge: TextStyle(
        fontSize: 20,                               //Tamaño letra
        color: Color.fromARGB(255, 5, 0, 103),    //Color letras
        fontFamily: fontFamily,                     //
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
        fontFamily: fontFamily,
      ),
    ),
    inputDecorationTheme:
        textFieldDecoration, // Añadir aquí el estilo de TextField
    cardTheme: cardThemeNormal, // Establecer un tema de Card por defecto
  );

  /*
                  ---ESTILO TEXTFIELD---
  */

  static final InputDecorationTheme textFieldDecoration = InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 45, 45, 45), // Color del hint
      fontFamily: fontFamily,
    ),
    fillColor: AppTheme.fondoCuadroTexto, // Color de fondo
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    // Añadir esto para el color del texto
  );

  /*
                  ---ESTILO BOTONES---
  */

  static ButtonStyle botonFuncional() {
    //Para los botones funcionales
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 217, 227, 251),
      foregroundColor: Color.fromARGB(255, 60, 120, 255), // Color del texto
      textStyle: TextStyle(
        fontFamily: fontFamily, //Establecido al principio Tipo de letra.
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  /*
                  ---ESTILO CARDS---
  */

// Estilo para Card SIN ABRIR
  static final CardTheme cardThemeNormal = CardTheme(
    color: Colors.white,
    shadowColor: const Color.fromARGB(255, 158, 158, 158),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
  );

  // Estilo para Card COMPLETADAS
  static final CardTheme cardThemeSuccess = CardTheme(
    color: Colors.green.shade100,
    shadowColor: Colors.green,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
  );

  // Estilo para Card EMPEZADAS
  static final CardTheme cardThemeError = CardTheme(
    color: Colors.red.shade100,
    shadowColor: const Color.fromARGB(255, 225, 183, 28),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.all(10),
  );
}
