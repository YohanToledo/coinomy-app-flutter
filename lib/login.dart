import 'package:coinomy/global-constants.dart';
import 'package:coinomy/home.dart';
import 'package:coinomy/register.dart';
import 'package:coinomy/screens.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
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
              height: MediaQuery.of(context).size.height * 0.40,
              color: LIGHT_COLOR,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.60,
                color: DARK_COLOR,
                child: ListView(children: <Widget>[
                  Container(
                      child: Center(
                          child: Text(
                    'Acesse Sua Conta',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: FONT_TITLE_SIZE,
                        color: LIGHT_COLOR),
                  ))),
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
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: ElevatedButton(
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: DARK_COLOR,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: LIGHT_COLOR),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Screens();
                          }));
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: const Text(
                      'Não possui uma conta? Crie agora mesmo!',
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                  ),
                ]))
          ])),
    );
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
