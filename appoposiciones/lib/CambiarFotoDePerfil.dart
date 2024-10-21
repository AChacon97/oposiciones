import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Asegúrate de agregar la dependencia en pubspec.yaml

class CambiarFotoDePerfil extends StatefulWidget {
  const CambiarFotoDePerfil({super.key});

  @override
  _CambiarFotoDePerfilState createState() => _CambiarFotoDePerfilState();
}

class _CambiarFotoDePerfilState extends State<CambiarFotoDePerfil> {
  XFile? _image; // Variable para almacenar la imagen seleccionada

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Permitir al usuario seleccionar una imagen desde la galería
    _image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {}); // Actualiza el estado para mostrar la imagen seleccionada
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Foto de Perfil'),
      ),
      body: Center(
        // Cambiado a Center para centrar los elementos
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:
                    _pickImage, // Llama a la función para seleccionar una imagen
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: _image != null
                      ? FileImage(
                          File(_image!.path)) // Muestra la imagen seleccionada
                      : null,
                  child: _image == null
                      ? const Icon(
                          Icons.add_a_photo,
                          size: 40,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed:
                    _pickImage, // Llama a la función para seleccionar una imagen
                child: const Text('Cargar Imagen desde tu Equipo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
