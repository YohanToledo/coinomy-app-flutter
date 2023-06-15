// ignore_for_file: prefer_const_constructors

import 'package:coinomy/global-constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isVisibleValues = false;

  void toggleValuesVisibility() {
    setState(() {
      isVisibleValues = !isVisibleValues;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: DARK_COLOR,
              child: ListView(children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                TopButtons(context),
                SizedBox(
                  height: 30,
                ),
                BalancoMensal(),
                SizedBox(
                  height: 20,
                ),
                TotalReceitasDespesas(),
                SizedBox(
                  height: 30,
                ),
                Listagem(context),
              ]),
            ),
          ])),
    );
  }

  Widget TopButtons(BuildContext context) {
    return Container(
        height: 20,
        width: 100,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.86, 10, 10, 0),
          child: GestureDetector(
            onTap: toggleValuesVisibility,
            child: Icon(
              isVisibleValues ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget BalancoMensal() {
    return Container(
      height: 80,
      child: ListView(children: <Widget>[
        Center(
          child: Text(
            'Balanço Mensal',
            style: TextStyle(
                color: Colors.white,
                fontSize: FONT_TITLE_SIZE,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Center(
            child: Text(
          isVisibleValues ? "R\$ 1500.00" : "*********",
          style: TextStyle(
              color: Colors.white,
              fontSize: FONT_TITLE_SIZE,
              fontWeight: FontWeight.w600),
        ))
      ]),
    );
  }

  Widget TotalReceitasDespesas() {
    return Container(
        height: 80,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_circle_up_rounded,
                  color: Colors.green,
                ),
                SizedBox(height: 8),
                Text(
                  isVisibleValues ? "R\$ 3000.00" : "*********",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: FONT_TITLE_SIZE,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_circle_down_rounded,
                  color: Colors.red,
                ),
                SizedBox(height: 8),
                Text(
                  isVisibleValues ? "R\$ 1500.00" : "*********",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: FONT_TITLE_SIZE,
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget Listagem(context) {
    return Container(
      height: 300,
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: ListView(
          children: <Widget>[for (var t in transactions) Card(context, t)]),
    );
  }

  Widget Card(context, Transaction transaction) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 60,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: transaction.tipo == "RECEITA"
                ? const Color.fromARGB(167, 76, 175, 79)
                : const Color.fromARGB(143, 244, 67, 54)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              CategoryIcons[transaction.icone],
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              transaction.descricao,
              style: TextStyle(
                color: Colors.white,
                fontSize: FONT_TITLE_SIZE,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              isVisibleValues
                  ? "R\$ " + transaction.valor.toStringAsFixed(2)
                  : "R\$ *********",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: FONT_TITLE_SIZE,
              ),
            ),
          ],
        ));
  }
}

const CategoryIcons = {
  "cifrao": Icons.monetization_on_outlined,
  "carrinho_mercado": Icons.shopping_cart_outlined,
  "bomba_combustivel": Icons.local_gas_station_outlined,
  "health": Icons.healing_rounded,
};

class Transaction {
  int? id;
  String descricao = "";
  double valor = 0;
  String tipo = "";
  String icone = "";

  Transaction(
      int? id, String descricao, double valor, String tipo, String icone) {
    this.id = id;
    this.descricao = descricao;
    this.valor = valor;
    this.tipo = tipo;
    this.icone = icone;
  }
}

final List<Transaction> transactions = [
  Transaction(1, "teste", 200.0, "RECEITA", "cifrao"),
  Transaction(2, "compras mercado", 159.80, "DESPESA", "carrinho_mercado"),
  Transaction(3, "gasosa", 80.0, "DESPESA", "bomba_combustivel"),
  Transaction(4, "salario", 5000.0, "RECEITA", "cifrao"),
  Transaction(5, "Desodorante rexona", 27.50, "DESPESA", "health"),
];
