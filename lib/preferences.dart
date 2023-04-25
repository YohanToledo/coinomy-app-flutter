import 'package:coinomy/home.dart';
import 'package:coinomy/register.dart';
import 'package:coinomy/screens.dart';
import 'package:flutter/material.dart';

import 'global-constants.dart';
import 'login.dart';

class Preferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 6),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: DARK_COLOR,
              child: ListView(children: <Widget>[
                Text(
                  'Preferências',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                OptionCard(context, "Minha conta", Icons.account_circle_outlined, ),
                OptionCard(context, "Privacidade",Icons.privacy_tip),
                OptionCard(context,"Moeda",Icons.money_off_outlined),
                OptionCard(context,"Contas",Icons.account_balance),
                OptionCard(context,"Categoria",Icons.category),
                OptionCard(context,"Voltar",Icons.exit_to_app),
              ]),
            ),
          ])),
    );
  }
}

Widget OptionCard(context, String nameLabel, IconData icones) {
  return Container(
    
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.grey),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  <Widget>[
          Icon(
            icones,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            nameLabel ,
            style: TextStyle(
              color: Colors.white,
              fontSize: FONT_TITLE_SIZE,
            ),
          ),
        ],
      ));
}
