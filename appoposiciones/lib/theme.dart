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

  // Estilo de TextField
  static final InputDecorationTheme textFieldDecoration = InputDecorationTheme( //TEXTFIELD
    hintStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 0, 0, 0), // Color del hint
      fontFamily: fontFamily,
    ),
    fillColor: AppTheme.fondoCuadroTexto, // Color de fondo
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    // Añadir esto para el color del texto
  );

  // Define un ThemeData para usar en toda la app
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontFamily: fontFamily,
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
        fontFamily: fontFamily,
      ),
    ),
    inputDecorationTheme:
        textFieldDecoration, // Añadir aquí el estilo de TextField
  );

  // ESTILO BOTONES
  static ButtonStyle botonFuncional() {
    //Para los botones funcionales
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 60, 120, 255),
      foregroundColor: Color.fromARGB(255, 20, 20, 200), // Color del texto
      textStyle: TextStyle(
        fontFamily: fontFamily, //Establecido al principio Tipo de letra.
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
