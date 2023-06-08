import 'dart:convert';

import 'package:coinomy/global-constants.dart';
import 'package:coinomy/home.dart';
import 'package:coinomy/http_service.dart';
import 'package:coinomy/register.dart';
import 'package:coinomy/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart' show rootBundle;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _loginState createState() {
    return _loginState();
  }
}

class _loginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  bool _ocultaSenha = false;
  @override
  void initState() {
    super.initState();
    _ocultaSenha = true;
  }

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
              child: Image.asset('assets/images/logo-dark.png'),
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
                          if (validarAcesso(
                              _emailController.text, _senhaController.text)) {
                            /*print(HttpService().login(
                                _emailController.text, _senhaController.text));*/
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Screens();
                            }));
                          }
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

  Widget CustomTextField(context, String labelString) {
    IconData? icon = ICONS[labelString.toLowerCase()];

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Center(
          child: TextFormField(
              controller: labelString.toUpperCase() == 'EMAIL'
                  ? _emailController
                  : _senhaController,
              obscureText: labelString.toUpperCase() == 'SENHA',
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
}

const ICONS = {
  "email": Icons.email,
  "senha": Icons.lock_outline_rounded,
  "nome": Icons.person,
};

validarAcesso(String email, String senha) {
  String _email = "admin@teste";
  String _senha = "321";

  if (email == _email && senha == _senha) {
    return true;
  }

  return false;
}
