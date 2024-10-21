import 'package:flutter/material.dart';

const String fontFamily = 'Times New Roman';

class AppTheme {
  // Paleta de colores
  static const Color primaryColor = Color(0xFF6200EA); // Morado
  static const Color secondaryColor = Color(0xFF03DAC6); // Verde aguamarina

  // Colores FONDO BOTONES TEMAS
  static const Color fodoCompletado = Color(0xFF388E3C); // fondo TEMA COMPLETO
  static const Color fondoEmpezado = Color(0xFFFFC107); // fondo TEMA EMPEZADO
  static const Color FondoNoCompletado =
      Color.fromARGB(255, 255, 255, 255); // Fondo TEMA sin EMPEZAR

//Colores TEXTO BOTONES TEMAS
  static const Color textCompletado =
      Color.fromRGBO(32, 98, 35, 1); // Letras texto TEMA COMPLETO
  static const Color textEmpezado =
      Color(0xFF6D4C41); // Letras texto TEMA EMPEZADO
  static const Color textNoAbierto =
      Colors.black; // Letras texto TEMA sin EMPEZAR

//Colores para respuesta correcta e incorrecta.
  static const Color respuestaCorecta = Color(0xFF4CAF50); // Verde
  static const Color respuestaIncorrecta = Color(0xFFD32F2F); // Rojo oscuro

//Colores para Fondo cuadros de diálogo.
  static const Color fondoCuadroTexto =
      Color.fromARGB(255, 109, 172, 217); // Fondo casillas a RELLENAR
  static const Color fondoBotonFuncional = Color.fromARGB(
      255, 115, 115, 250); // Fondo Botón Funcionales (No de TEMAS)

  // Tipografía: Times New Roman (nota que Flutter no tiene esta fuente por defecto)
  static const String fontFamily = 'Times New Roman';

  // Define un ThemeData para usar en toda la app
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 255, 51),
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
  );

  // Estilo de botones según el estado
  static ButtonStyle buttonStyle(Color backgroundColor, Color textColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      textStyle: TextStyle(
        color: textColor,
        fontFamily: fontFamily,
      ),
    );
  }
}

// Estilo para los TextField
final InputDecorationTheme textFieldDecoration = InputDecorationTheme(
  hintStyle: TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: const Color.fromARGB(255, 159, 128, 128),
    fontFamily: fontFamily,
  ),
  fillColor: const Color.fromARGB(255, 87, 177, 87), // Color de fondo
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0), // Borde con esquinas redondeadas
  ),
);
