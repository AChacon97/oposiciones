import 'package:appoposiciones/home.dart';
import 'package:appoposiciones/registro.dart';
import 'package:flutter/material.dart';
import 'theme.dart'; // Importa el archivo de tema
import 'theme.dart'; // Importa el archivo que contiene el tema
class PantallaLogin extends StatefulWidget {
  const PantallaLogin(
      {super.key,
      required this.title}); // Esto es el constructor de la clase. Le pasamos title de forma requerida, indicandole que es obligatorio.
  // Esto viene muy bien porque cada vez que creeamos una instancia de esta pantalla se deberá de poner un valor para title y lo podremos controlar mejor.

  final String
      title; // Aqui la tenemos como una constante para que no cambie de valor

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //backgroundColor: Theme.of(context).colorScheme.inversePrimary, <--

            ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Image.asset(
                  "assets/images/LogoAcademia.jpg",
                  height: 100,
                  width: 150,
                ),
                const Text(
                  'BIENVENIDOS A TU APP DE AUTOESCUELA',
                  style: TextStyle(
                    fontSize: 28.0, // Tamaño de la letra.
                    fontWeight: FontWeight.bold, // La letra en negrita.
                    color: Colors.blueAccent, // Color de la letra
                    shadows: <Shadow>[
                      Shadow(
                        // Permite añadir sombras a los textos
                        offset:
                            Offset(1.0, 2.0), // Desplazamiento de la sombra.
                        blurRadius: 3.0, // Difuminado de la sombra.
                        color: Colors.black26, // Color de la sombra
                      )
                    ],
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  // Esto es un contenedor donde recogemos el TextField de la barra, se ha creado para poder meter un width para el ancho
                  width: 475,
                  child: const TextField(
                      decoration: InputDecoration(
                    //filled: true,
                    hintText: 'Usuario',
                  )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  //Esto es un contenedor donde recogemos el TextField de la barra, se ha creado para poder meter un width para el ancho.
                  width: 475,
                  child: const TextField(
                      // Todo lo que conlleva la barra contraseña.
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Contraseña')),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                    //fila para acoger los métodos de los botones.
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BotonAcceder(context),
                    ]),
                const SizedBox(
                  height: 60,
                ),
                Column(
                    //fila para acoger los métodos de los botones.

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '¿No estás registrado?',
                        style: TextStyle(
                          fontSize: 20.0, // Tamaño de la letra.
                          fontWeight: FontWeight.bold, // La letra en negrita.
                          color: Colors.blueAccent, // Color de la letra
                          letterSpacing: 2.0,
                        ),
                      ),
                      BotonRegistrar(context), //Llamada al BOTÓN REGISTRAR
                    ]),
              ],
            ),
          ),
        ));
  }
}

Widget BotonRegistrar(BuildContext context) {
  //BOTÓN REGISTRAR
  return ElevatedButton(
    style: AppTheme.botonFuncional(), // Aplica tu estilo de botón funcional
    onPressed: () {
      // Navegar a la pantalla de registro al presionar el botón
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PantallaRegistro()),
      );
    },
    child: const Text(
      'Registrar', // Texto del botón
      style: TextStyle(
        fontSize: 20.0, // Cambia el tamaño del texto aquí
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget BotonAcceder(BuildContext context) {
  // Método para el botón acceder.
  return ElevatedButton(
    style: AppTheme.botonFuncional(),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Tap()),
      );
    },
    child: const Text('Login'),
  );
}
