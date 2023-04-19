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
                padding: const EdgeInsets.all(10),
                width: 100,
                height: 600, //MediaQuery.of(context).size.height * 0.8,
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
                  TotalReceitasDespesas()
                ]),
              ),
            ])),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: LIGHT_COLOR, width: 1.0))),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: true,
            backgroundColor: DARK_COLOR,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: LIGHT_COLOR,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: LIGHT_COLOR,
                  ),
                  label: "",
                  backgroundColor: DARK_COLOR),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.ellipsis,
                    color: LIGHT_COLOR,
                  ),
                  label: "",
                  backgroundColor: DARK_COLOR),
            ],
          ),
        ));
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
      height: 80,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
