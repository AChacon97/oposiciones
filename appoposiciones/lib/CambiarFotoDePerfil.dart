import 'package:flutter/material.dart'; // Importa el paquete de Flutter para la interfaz de usuario
import 'dart:io'; // Importa la biblioteca para manejar archivos
import 'package:image_picker/image_picker.dart'; // Importa la biblioteca para seleccionar imágenes
import 'package:permission_handler/permission_handler.dart'; // Importa el paquete para manejar permisos
import 'theme.dart'; // Importa el archivo que contiene el tema
// Clase principal para cambiar la foto de perfil
class CambiarFotoDePerfil extends StatefulWidget {
  const CambiarFotoDePerfil({super.key}); // Constructor de la clase

  @override
  _CambiarFotoDePerfilState createState() =>
      _CambiarFotoDePerfilState(); // Crea el estado de la pantalla
}

// Clase que maneja el estado de la pantalla de cambio de foto de perfil
class _CambiarFotoDePerfilState extends State<CambiarFotoDePerfil> {
  XFile? _image; // Variable para almacenar la imagen seleccionada

  // Método para permitir al usuario seleccionar una imagen
  Future<void> _pickImage() async {
    // Pide permiso de almacenamiento
    var status = await Permission.storage.request();

    if (status.isGranted) {
      final ImagePicker picker =
          ImagePicker(); // Crea una instancia de ImagePicker
      // Permitir al usuario seleccionar una imagen desde la galería
      _image = await picker.pickImage(source: ImageSource.gallery);
      setState(
          () {}); // Actualiza el estado para mostrar la imagen seleccionada
    } else {
      // Manejar el caso en que el permiso no es otorgado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Permiso denegado para acceder a la galería.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Cambiar Foto de Perfil'), // Título de la barra de aplicación
      ),
      body: Center(
        // Centra los elementos en la pantalla
        child: Padding(
          padding:
              const EdgeInsets.all(16.0), // Espaciado alrededor del contenido
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centra el contenido verticalmente
            children: [
              // Gestor de eventos para detectar toques en el círculo
              GestureDetector(
                onTap:
                    _pickImage, // Llama a la función para seleccionar una imagen al tocar
                child: CircleAvatar(
                  radius: 70, // Radio del círculo
                  backgroundColor:
                      Colors.grey[300], // Color de fondo del círculo
                  backgroundImage: _image != null
                      ? FileImage(
                          File(_image!.path)) // Muestra la imagen seleccionada
                      : null, // Si no hay imagen, no se muestra nada
                  child: _image == null
                      ? const Icon(
                          Icons.add_a_photo, // Icono para añadir una foto
                          size: 40, // Tamaño del icono
                          color: Colors.white, // Color del icono
                        )
                      : null, // Si hay imagen, no muestra el icono
                ),
              ),
              const SizedBox(height: 20), // Espaciado vertical
              // Botón para cargar una imagen
              ElevatedButton(
                onPressed:
                    _pickImage, // Llama a la función para seleccionar una imagen
                child: const Text(
                    'Cargar Imagen desde tu Equipo'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}
