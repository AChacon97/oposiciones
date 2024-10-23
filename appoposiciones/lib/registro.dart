import 'dart:convert'; // Para manejar JSON
import 'package:flutter/material.dart'; // Paquete de Flutter para la interfaz de usuario
import 'package:flutter/services.dart'; // Para cargar archivos locales
import 'package:path_provider/path_provider.dart'; // Para obtener el directorio del sistema
import 'dart:io'; // Para manejar archivos
import 'package:appoposiciones/home.dart'; // Asegúrate de que la ruta sea correcta
import 'theme.dart'; // Importa el archivo que contiene el tema

// Clase principal de la pantalla de registro
class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key}); // Constructor de la clase

  @override
  State<PantallaRegistro> createState() =>
      _PantallaRegistroState(); // Crea el estado de la pantalla
}

// Clase que maneja el estado de la pantalla de registro
class _PantallaRegistroState extends State<PantallaRegistro> {
  // Controladores para los campos de texto
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Variables para almacenar errores de validación
  String? _usernameError;
  String? _emailError;
  String? _passwordError;

  List<dynamic> _users = []; // Lista para almacenar usuarios

  @override
  void initState() {
    super.initState();
    _loadUsers(); // Cargar usuarios al iniciar
  }

  // Función para cargar usuarios desde un archivo JSON
  Future<void> _loadUsers() async {
    try {
      final directory =
          await getApplicationDocumentsDirectory(); // Obtiene el directorio de documentos
      final file =
          File('${directory.path}/data.json'); // Define la ruta del archivo
      if (await file.exists()) {
        // Verifica si el archivo existe
        final String response =
            await file.readAsString(); // Lee el contenido del archivo
        final data = json.decode(response); // Decodifica el JSON
        setState(() {
          _users = data; // Asigna los usuarios a la lista
        });
      }
    } catch (e) {
      print('Error al cargar usuarios: $e'); // Manejo de errores
    }
  }

  // Función para guardar usuarios en el archivo JSON
  Future<void> _saveUsers() async {
    final directory =
        await getApplicationDocumentsDirectory(); // Obtiene el directorio de documentos
    final file =
        File('${directory.path}/data.json'); // Define la ruta del archivo

    String jsonString =
        jsonEncode(_users); // Convierte la lista de usuarios a JSON
    await file.writeAsString(jsonString); // Guarda el JSON en el archivo
  }

  // Función para registrar un nuevo usuario
  void _registerUser() {
    final newUser = {
      'username': _usernameController.text, // Obtiene el nombre de usuario
      'email': _emailController.text, // Obtiene el correo electrónico
      'password': _passwordController.text, // Obtiene la contraseña
    };

    setState(() {
      _users.add(newUser); // Agrega el nuevo usuario a la lista
    });

    _saveUsers(); // Guarda usuarios en el archivo JSON
    print(
        'Usuario registrado: $newUser'); // Imprime el nuevo usuario en consola

    // Navega a la página de inicio
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const Tap()), // Cambia a la página de inicio
    );
  }

  // Función para validar el nombre de usuario
  void _validateUsername(String value) {
    setState(() {
      if (value.isEmpty) {
        _usernameError =
            'El nombre de usuario no puede estar vacío'; // Mensaje de error si está vacío
      } else if (value.length > 15) {
        _usernameError =
            'Máximo 15 caracteres'; // Mensaje de error si excede 15 caracteres
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        _usernameError =
            'Sin caracteres especiales'; // Mensaje de error si tiene caracteres especiales
      } else {
        _usernameError = null; // No hay error
      }
    });
  }

  // Función para validar el correo electrónico
  void _validateEmail(String value) {
    setState(() {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$', // Expresión regular para el correo electrónico
      );

      if (value.isEmpty) {
        _emailError =
            'El correo electrónico no puede estar vacío'; // Mensaje de error si está vacío
      } else if (!emailRegex.hasMatch(value)) {
        _emailError =
            'Formato de correo electrónico inválido'; // Mensaje de error si el formato es incorrecto
      } else {
        _emailError = null; // No hay error
      }
    });
  }

  // Función para validar la contraseña
  void _validatePassword(String value) {
    setState(() {
      if (value.length < 8) {
        _passwordError =
            'Mínimo 8 caracteres'; // Mensaje de error si tiene menos de 8 caracteres
      } else if (!RegExp(r'[A-Z]').hasMatch(value) ||
          !RegExp(r'[a-z]').hasMatch(value) ||
          !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        _passwordError =
            'Debe contener una mayúscula, una minúscula y un símbolo'; // Mensaje de error si no cumple los requisitos
      } else {
        _passwordError = null; // No hay error
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'), // Título de la barra de aplicación
      ),
      body: Center(
        child: SingleChildScrollView(
          // Permite el desplazamiento en caso de que el teclado cubra el contenido
          child: Column(
            mainAxisSize: MainAxisSize.max, // Tamaño máximo del Column
            children: <Widget>[
              const Text(
                'Regístrate',
                style: TextStyle(
                  fontSize: 28.0, // Tamaño de fuente
                  fontWeight: FontWeight.bold, // Negrita
                  color: Colors.blueAccent, // Color del texto
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(5.0, 10.0), // Sombra del texto
                      blurRadius: 3.0,
                      color: Colors.black26,
                    )
                  ],
                  letterSpacing: 2.0, // Espaciado entre letras
                ),
              ),
              const SizedBox(height: 30), // Espaciado vertical
              Container(
                width: 475,
                child: TextField(
                  controller:
                      _usernameController, // Controlador del campo de texto
                  onChanged:
                      _validateUsername, // Valida el nombre de usuario al cambiar
                  decoration: InputDecoration(
                   
                   /* hintStyle: const TextStyle(
                      color: Colors.white, // Color del texto del hint
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),*/
                    hintText: 'Nombre de Usuario', // Texto de hint
                    
                    //fillColor: Colors.red, // Color de fondo
                    //filled: true, // Relleno
                    errorText: _usernameError, // Mensaje de error si existe
                  ),
                ),
              ),
              const SizedBox(height: 25), // Espaciado vertical
              Container(
                width: 475,
                child: TextField(
                  controller:
                      _emailController, // Controlador del campo de texto
                  onChanged:
                      _validateEmail, // Valida el correo electrónico al cambiar
                  decoration: InputDecoration(
                    /*hintStyle: const TextStyle(
                      color: Colors.white, // Color del texto del hint
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),*/
                    hintText: 'Correo Electrónico', // Texto de hint
                    /*fillColor: Colors.red, // Color de fondo
                    filled: true,*/ // Relleno
                    errorText: _emailError, // Mensaje de error si existe
                  ),
                ),
              ),
              const SizedBox(height: 25), // Espaciado vertical
              Container(
                width: 475,
                child: TextField(
                  controller:
                      _passwordController, // Controlador del campo de texto
                  onChanged:
                      _validatePassword, // Valida la contraseña al cambiar
                  decoration: InputDecoration(
                    /*hintStyle: const TextStyle(
                      color: Colors.white, // Color del texto del hint
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),*/
                    hintText: 'Contraseña', // Texto de hint
                    /*fillColor: Colors.red, // Color de fondo
                    filled: true,*/ // Relleno
                    errorText: _passwordError, // Mensaje de error si existe
                  ),
                  obscureText: true, // Oculta el texto de la contraseña
                ),
              ),
              const SizedBox(height: 25), // Espaciado vertical
              ElevatedButton(
                onPressed: () {
                  if (_usernameError == null &&
                      _emailError == null &&
                      _passwordError == null) {
                    _registerUser();
                  }
                },
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
