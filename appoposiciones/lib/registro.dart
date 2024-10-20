import 'package:flutter/material.dart';

class PantallaRegistro extends StatefulWidget {
  const PantallaRegistro({super.key});

  @override
  State<PantallaRegistro> createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _usernameError;
  String? _emailError;
  String? _passwordError;

  void _validateUsername(String value) {
    setState(() {
      if (value.length > 15) {
        _usernameError = 'Máximo 15 caracteres';
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        _usernameError = 'Sin caracteres especiales';
      } else {
        _usernameError = null;
      }
    });
  }

  void _validateEmail(String value) {
    setState(() {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (value.isEmpty) {
        _emailError = 'El correo electrónico no puede estar vacío';
      } else if (!emailRegex.hasMatch(value)) {
        _emailError = 'Formato de correo electrónico inválido';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.length < 8) {
        _passwordError = 'Mínimo 8 caracteres';
      } else if (!RegExp(r'[A-Z]').hasMatch(value) ||
          !RegExp(r'[a-z]').hasMatch(value) ||
          !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        _passwordError =
            'Debe contener una mayúscula, una minúscula y un símbolo';
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const Text(
                'Regístrate',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(5.0, 10.0),
                      blurRadius: 3.0,
                      color: Colors.black26,
                    )
                  ],
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 475,
                child: TextField(
                  controller: _usernameController,
                  onChanged: _validateUsername,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Nombre de Usuario',
                    fillColor: Colors.red,
                    filled: true,
                    errorText: _usernameError,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 475,
                child: TextField(
                  controller: _emailController,
                  onChanged: _validateEmail,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Correo Electrónico',
                    fillColor: Colors.red,
                    filled: true,
                    errorText: _emailError,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                width: 475,
                child: TextField(
                  controller: _passwordController,
                  onChanged: _validatePassword,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Contraseña',
                    fillColor: Colors.red,
                    filled: true,
                    errorText: _passwordError,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 25),
              Registro(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget Registro() {
  return ElevatedButton(
    onPressed: () {
      // Aquí iría la lógica para registrar al usuario.
    },
    child: const Text('Registrar'),
  );
}
