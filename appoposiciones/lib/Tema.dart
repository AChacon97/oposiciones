import 'package:flutter/material.dart';

class Tema {
  final int id;
  final String titulo;
  final String ntema;

  Tema({required this.id, required this.titulo, required this.ntema});

  factory Tema.fromJson(Map<String, dynamic> json){
    return Tema(
      id: json['id'],
      titulo: json['titulo'],
      ntema:json['ntema'],
    );
  }
}

