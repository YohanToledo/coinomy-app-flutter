import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../models/categoriamodel.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();

  factory DatabaseManager() {
    return _instance;
  }

  Database? _database;

  DatabaseManager._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String databasePath = await getDatabasesPath();
    final String databaseFilePath = path.join(databasePath, 'categorias.db');

    return await openDatabase(
      databaseFilePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE categorias (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            tipo TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertCategoria(CategoriaModel categoria) async {
    final Database db = await database;
    await db.insert('categorias', categoria.toMap());
  }

  Future<List<CategoriaModel>> getCategorias() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('categorias');
    return List.generate(maps.length, (index) {
      return CategoriaModel(
        id: maps[index]['id'],
        nome: maps[index]['nome'],
        tipo: maps[index]['tipo'],
      );
    });
  }
}
