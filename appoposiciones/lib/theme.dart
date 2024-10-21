import 'package:flutter/material.dart';

class AppTheme {
  // Paleta de colores
  static const Color primaryColor = Color(0xFF6200EA); // Morado
  static const Color secondaryColor = Color(0xFF03DAC6); // Verde aguamarina

  // Colores FONDO TEMAS
  static const Color completedColor = Color(0xFF388E3C); // fondo TEMA COMPLETO
  static const Color startedColor = Color(0xFFFFC107); // fondo TEMA EMPEZADO
  static const Color notOpenedColor = Colors.white; // Fondo TEMA sin EMPEZAR

//Colores TEXTO TEMAS
  static const Color textCompleted = Color.fromRGBO(32, 98, 35, 1); // Letras texto TEMA COMPLETO
  static const Color textStarted = Color(0xFF6D4C41); // Letras texto TEMA EMPEZADO
  static const Color textNotOpened = Colors.black; // Letras texto TEMA sin EMPEZAR

  static const Color correctAnswerColor = Color(0xFF4CAF50); // Verde
  static const Color incorrectAnswerColor = Color(0xFFD32F2F); // Rojo oscuro

  // Tipografía: Times New Roman (nota que Flutter no tiene esta fuente por defecto)
  static const String fontFamily = 'Times New Roman';

  // Define un ThemeData para usar en toda la app
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
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
