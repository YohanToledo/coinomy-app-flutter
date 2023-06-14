import 'dart:html';

import 'package:coinomy/global-constants.dart';
import 'package:coinomy/http_service.dart';
import 'package:coinomy/login.dart';
import 'package:coinomy/main.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _registerState createState() {
    return _registerState();
  }
}

class _registerState extends State<Register> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Register(),
    );
  }
}

class _Register extends StatelessWidget {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _senhaConfirmController = TextEditingController();
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
            child: Image.asset('assets/images/logo-dark.png'),
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
                CustomTextField(context, 'Nome', _nomeController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Email', _emailController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Senha', _senhaController),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(context, 'Senha', _senhaConfirmController),
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
                        HttpService()
                            .register(_nomeController.text,
                                _emailController.text, _senhaController.text)
                            .then((value) => {
                                  if (value)
                                    {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Login();
                                      }))
                                    }
                                });
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

Widget CustomTextField(context, String labelString, controller) {
  IconData? icon = ICONS[labelString.toLowerCase()];

  return Container(
    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
    child: Center(
        child: TextFormField(
            enableInteractiveSelection: true,
            autocorrect: false,
            enableSuggestions: false,
            controller: controller,
            style: TextStyle(color: Colors.white),
            obscureText: labelString == 'Senha',
            keyboardType: labelString == 'Email'
                ? TextInputType.emailAddress
                : TextInputType.text,
            decoration: InputDecoration(
              errorText: validateEmptyField(controller.text),
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

String? validateEmptyField(String value) {
  if (value.isEmpty) {
    return "Campo obrigatorio";
  }
  return null;
}
