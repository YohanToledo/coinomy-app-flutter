import 'package:flutter/material.dart';

class CategoriaModel {
  final int? id;
  final String nome;
  final String tipo;

  CategoriaModel({this.id, required this.nome, required this.tipo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
    };
  }
}
