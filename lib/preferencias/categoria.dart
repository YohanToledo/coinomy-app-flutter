// ignore_for_file: prefer_const_constructors
import 'dart:ui';

import 'package:coinomy/global-constants.dart';
import 'package:flutter/material.dart';

import '../categoriapage.dart';
import '../database/databasemanager.dart';
import '../models/categoriamodel.dart';

class Categoria extends StatelessWidget {
  final DatabaseManager databaseManager = DatabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK_COLOR,
      appBar: AppBar(
        backgroundColor: LIGHT_COLOR,
        title: Text('Categorias', style: TextStyle(color: DARK_COLOR)),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  alignment: Alignment.centerLeft, // Align text to the left
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Adicionar categoria de receita'),
                      content: TextField(
                        controller: TextEditingController(),
                        decoration:
                            InputDecoration(labelText: 'Nome da categoria'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            // String nomeCategoria = TextEditingController().text;
                            // CategoriaModel categoria = CategoriaModel(
                            //   nome: nomeCategoria,
                            //   tipo: 'receita',
                            // );
                            //await databaseManager.insertCategoria(categoria);

                            Navigator.pop(context);
                          },
                          child: Text('Salvar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.add_circle_outline_sharp), // Icon for the button
                    SizedBox(width: 8), // Spacing between icon and text
                    Text('Adicionar categoria de receita'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Adicionar categoria de despesa'),
                      content: TextField(
                        controller: TextEditingController(),
                        decoration:
                            InputDecoration(labelText: 'Nome da categoria'),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () async {
                            // String nomeCategoria = TextEditingController().text;
                            // CategoriaModel categoria = CategoriaModel(
                            //   nome: nomeCategoria,
                            //   tipo: 'despesa',
                            // );
                            // await databaseManager.insertCategoria(categoria);

                            Navigator.pop(context);
                          },
                          child: Text('Salvar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.add_circle_outline_sharp), // Icon for the button
                    SizedBox(width: 8), // Spacing between icon and text
                    Text('Adicionar categoria de despesa'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoriaPage(DatabaseManager())),
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.list), // Icon for the button
                    SizedBox(width: 8), // Spacing between icon and text
                    Text('Visualizar Minhas Categorias'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
