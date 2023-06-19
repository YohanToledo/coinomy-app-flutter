import 'package:flutter/material.dart';

import 'database/databasemanager.dart';
import 'models/categoriamodel.dart';

class CategoriaPage extends StatefulWidget {
  CategoriaPage(databaseManager);

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  List<CategoriaModel> categorias = [];

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
                _adicionarCategoria();
              },
              child: Text('Adicionar categoria'),
            ),
            SizedBox(height: 20),
            Text(
              'Categorias:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categorias[index].nome),
                    subtitle: Text(categorias[index].tipo),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _adicionarCategoria() async {
    CategoriaModel novaCategoria = CategoriaModel(
      nome: 'Categoria 1',
      tipo: 'Receita',
    );

    await DatabaseManager().insertCategoria(novaCategoria);

    List<CategoriaModel> listaCategorias =
        await DatabaseManager().getCategorias();

    setState(() {
      categorias = listaCategorias;
    });
  }
}
