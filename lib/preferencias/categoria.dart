import 'package:flutter/material.dart';

import '../categoriapage.dart';
import '../database/databasemanager.dart';
import '../models/categoriamodel.dart';

class Categoria extends StatelessWidget {
  final DatabaseManager databaseManager = DatabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
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
                          String nomeCategoria = TextEditingController().text;

                          CategoriaModel categoria = CategoriaModel(
                            nome: nomeCategoria,
                            tipo: 'receita',
                          );

                          await databaseManager.insertCategoria(categoria);

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
              child: Text('Adicionar categoria de receita'),
            ),
            ElevatedButton(
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
                          String nomeCategoria = TextEditingController().text;

                          CategoriaModel categoria = CategoriaModel(
                            nome: nomeCategoria,
                            tipo: 'despesa',
                          );

                          await databaseManager.insertCategoria(categoria);

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
              child: Text('Adicionar categoria de despesa'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoriaPage(DatabaseManager())),
                );
              },
              child: Text('Ir para Categoria'),
            ),
          ],
        ),
      ),
    );
  }
}
