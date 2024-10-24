import 'package:flutter/material.dart';

const String fontFamily = 'Times New Roman';

class AppTheme {
  // Paleta de colores
  static const Color primaryColor = Color(0xFF6200EA); // Morado
  static const Color secondaryColor =
      Color.fromARGB(255, 209, 225, 224); // Verde aguamarina

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

  /* Define un ThemeData para usar en TODA LA APP */
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 28, // Tamaño letra
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
        fontFamily: fontFamily,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(1.0, 2.0), // Desplazamiento de la sombra.
            blurRadius: 3.0, // Difuminado de la sombra.
            color: Colors.black26, // Color de la sombra
          )
        ],
      ),
      bodyLarge: TextStyle(
        fontSize: 20.0, // Tamaño de la letra.
        fontWeight: FontWeight.bold, // La letra en negrita.
        color: Colors.blueAccent, // Color de la letra
        letterSpacing: 2.0,
        fontFamily: fontFamily, //
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
        fontFamily: fontFamily,
      ),
    ),
    inputDecorationTheme: textFieldDecoration,
    cardTheme: cardThemeNormal, // Establecer un tema de Card por defecto
  );

  /* ---ESTILO TEXTFIELD--- */
  static final InputDecorationTheme textFieldDecoration = InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 45, 45, 45), // Color del hint
      fontFamily: fontFamily,
    ),
    fillColor: Color.fromARGB(255, 109, 172, 217), // Color de fondo
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  /* ---ESTILO BOTONES--- */
  static ButtonStyle botonFuncional() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 217, 227, 251),
      foregroundColor: Color.fromARGB(255, 60, 120, 255), // Color del texto
      textStyle: TextStyle(
        fontFamily: fontFamily, // Establecido al principio Tipo de letra.
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  static ButtonStyle botonConfiguracion() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 183, 183, 183),
      foregroundColor: Color.fromARGB(255, 52, 57, 69), // Color del texto
      textStyle: TextStyle(
        fontFamily: fontFamily, // Establecido al principio Tipo de letra.
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }

  /* ---ESTILO CARDS--- */
  // Estilo para Card SIN ABRIR
  static final CardTheme cardThemeNormal = CardTheme(
    color: const Color.fromARGB(255, 210, 210, 210),
    shadowColor: const Color.fromARGB(255, 126, 126, 126),
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
