import 'package:appoposiciones/home.dart';
import 'package:appoposiciones/registro.dart';
import 'package:flutter/material.dart';

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
                  "assets/images/Imagen de WhatsApp 2024-09-29 a las 14.01.40_25073ee1 - copia.jpg",
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
                    // Todo lo que conlleva la barra usuario.
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      hintText: 'Usuario',
                      fillColor: Colors.red,
                      filled: true,
                    ),
                  ),
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
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                      hintText: 'Contraseña',
                      fillColor: Colors.red,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                    //fila para acoger los métodos de los botones.
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        width: 25,
                      ),
                      BotonAcceder(context),
                    ]),
                const SizedBox(
                  height: 60,
                ),
                Row(
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
                      const SizedBox(
                        width: 15,
                      ),
                      BotonRegistrar(context),
                    ]),
              ],
            ),
          ),
        ));
  }
}

/*Widget BotonRegistrar() {
  // Método para el botón registrar
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Registrar'),
  );
}*/

//EL BOTON ANTES DE SUBIRLO

Widget BotonRegistrar(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      // Navegar a la pantalla de registro al presionar el botón
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PantallaRegistro()),
      );
    },
    child: const Text('Registrar'), // Texto del botón
  );
}

Widget BotonAcceder(BuildContext context) {
  // Método para el botón acceder.
  return ElevatedButton(
    style: ElevatedButton.styleFrom(minimumSize: Size(200, 90)), //cambio
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Tap()),
      );
    },
    child: const Text('Login'),
  );
}
