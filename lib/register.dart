import 'dart:html';

import 'package:coinomy/main.dart';
import 'package:flutter/material.dart';

const double FONT_TITLE_SIZE = 20;
const Color LIGHT_COLOR = Color.fromARGB(255, 41, 160, 182);
const Color DARK_COLOR = Color.fromARGB(255, 35, 3, 80);

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Register(),
    );
  }
}

class _Register extends StatelessWidget {
  //String email = 'teste@gmail.com';
  //String pass = 'abc';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            width: 100,
            height: MediaQuery.of(context).size.height * 0.30,
            color: LIGHT_COLOR,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.70,
              color: DARK_COLOR,
              child: ListView(children: <Widget>[
                Container(
                    child: Center(
                        child: Text(
                  'Cadastre-se',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: FONT_TITLE_SIZE,
                      color: LIGHT_COLOR),
                ))),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Nome'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Email'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Senha'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Senha'),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: DARK_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: LIGHT_COLOR),
                      onPressed: () {
                        //Navigator.push(context,
                        //    MaterialPageRoute(builder: (context) {
                        //  return MenuPrincipal();
                        //}));
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: const Text(
                    'Já possui uma conta? Acesse sua conta!',
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ]))
        ]));
  }
}

const ICONS = {
  "email": Icons.email,
  "senha": Icons.lock_outline_rounded,
  "nome": Icons.person,
};

Widget CustomTextField(context, String labelString) {
  IconData? icon = ICONS[labelString.toLowerCase()];

  return Container(
    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: Center(
        child: TextFormField(
            style: TextStyle(color: Colors.white),
            obscureText: labelString == 'Senha',
            keyboardType: labelString == 'Email'
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: LIGHT_COLOR, width: 0.0),
              ),
              label: Text(
                labelString,
                style: TextStyle(color: LIGHT_COLOR),
              ),
              prefixIcon: Icon(icon, color: LIGHT_COLOR),
            ))),
  );
}
