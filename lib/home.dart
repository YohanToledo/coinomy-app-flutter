import 'package:coinomy/global-constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
        "R\$ 1500.00",
        style: TextStyle(
            color: Colors.white,
            fontSize: FONT_TITLE_SIZE,
            fontWeight: FontWeight.w600),
      ))
    ]),
  );
}

Widget TopButtons(BuildContext context) {
  return Container(
      height: 20,
      width: 100,
      child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.86, 10, 10, 0),
          child: Icon(
            Icons.remove_red_eye,
            color: Colors.white,
          )));
}

Widget TotalReceitasDespesas() {
  return Container(
      height: 30,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Text(
            '******',
            style: TextStyle(
              color: Colors.white,
              fontSize: FONT_TITLE_SIZE,
            ),
          )),
          SizedBox(
            width: 30,
          ),
          Center(
              child: Text(
            '******',
            style: TextStyle(
              color: Colors.white,
              fontSize: FONT_TITLE_SIZE,
            ),
          )),
        ],
      ));
}

Widget Listagem(context) {
  return Container(
    height: 300,
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: ListView(children: <Widget>[
      Card(context, Colors.red),
      Card(context, Colors.red),
      Card(context, Colors.green),
      Card(context, Colors.green),
      Card(context, Colors.green),
      Card(context, Colors.red),
    ]),
  );
}

Widget Card(context, Color color) {
  return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          Icon(
            Icons.local_gas_station,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'combustivel',
            style: TextStyle(
              color: Colors.white,
              fontSize: FONT_TITLE_SIZE,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            'R\$ 150.00',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: FONT_TITLE_SIZE,
            ),
          ),
        ],
      ));
}
