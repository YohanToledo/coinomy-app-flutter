// ignore_for_file: prefer_const_constructors

import 'package:coinomy/global-constants.dart';
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
      backgroundColor: DARK_COLOR,
      appBar: AppBar(
        backgroundColor: LIGHT_COLOR,
        title: Text('Categorias', style: TextStyle(color: DARK_COLOR)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Expanded(
                child: ListView(children: const [
              ListTile(
                iconColor: Colors.white,
                trailing: Icon(Icons.arrow_right_sharp),
                tileColor: NAV_BAR_COLOR,
                textColor: Colors.white,
                title: Text("Salario"),
                subtitle: Text(
                  "RECEITA",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              ListTile(
                iconColor: Colors.white,
                trailing: Icon(Icons.arrow_right_sharp),
                tileColor: NAV_BAR_COLOR,
                textColor: Colors.white,
                title: Text("Presente"),
                subtitle: Text(
                  "RECEITA",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              ListTile(
                iconColor: Colors.white,
                trailing: Icon(Icons.arrow_right_sharp),
                tileColor: NAV_BAR_COLOR,
                textColor: Colors.white,
                title: Text("Mercado"),
                subtitle: Text(
                  "DESPESA",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ListTile(
                iconColor: Colors.white,
                trailing: Icon(Icons.arrow_right_sharp),
                tileColor: NAV_BAR_COLOR,
                textColor: Colors.white,
                title: Text("Combustivel"),
                subtitle: Text(
                  "DESPESA",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              ListTile(
                iconColor: Colors.white,
                trailing: Icon(Icons.arrow_right_sharp),
                tileColor: NAV_BAR_COLOR,
                textColor: Colors.white,
                title: Text("Farmacia"),
                subtitle: Text(
                  "DESPESA",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ])
                // child: ListView.builder(
                //   itemCount: categorias.length,
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //       title: Text(categorias[index].nome),
                //       subtitle: Text(categorias[index].tipo),
                //     );
                //   },
                // ),
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
