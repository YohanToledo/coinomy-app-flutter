import 'dart:html';

import 'package:coinomy/global-constants.dart';
import 'package:coinomy/http_service.dart';
import 'package:coinomy/login.dart';
import 'package:coinomy/main.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _senhaConfirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _register() {
    setState(() {
      HttpService()
          .register(
        _nomeController.text,
        _emailController.text,
        _senhaController.text,
      )
          .then((value) {
        if (value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Login();
          }));

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cadastrado com sucesso'),
              backgroundColor: Colors.green,
              showCloseIcon: true,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Erro ao realizar cadastro! Verifique os dados inseridos e tente novamente!'),
              backgroundColor: Colors.red,
              showCloseIcon: true,
            ),
          );
        }
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Ocorreu um erro durante o registro.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
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
                      NameTextField(context, _nomeController),
                      const SizedBox(
                        height: 20,
                      ),
                      EmailTextField(context, _emailController),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(context, _senhaController),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordConfirmationTextField(
                          context, _senhaConfirmController),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: SizedBox.expand(
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
                              backgroundColor: LIGHT_COLOR,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _register();
                              }
                            },
                          ),
                        ),
                      ),
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
                    ],
                  ),
                ))
          ])),
    );
  }

  Widget NameTextField(BuildContext context, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Center(
        child: TextFormField(
          enableInteractiveSelection: true,
          autocorrect: false,
          enableSuggestions: false,
          controller: controller,
          style: TextStyle(color: Colors.white),
          obscureText: false,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: LIGHT_COLOR, width: 0.0),
            ),
            labelText: "Nome",
            labelStyle: TextStyle(color: LIGHT_COLOR),
            prefixIcon: Icon(Icons.person, color: LIGHT_COLOR),
          ),
          textInputAction: TextInputAction.next,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo é obrigatório';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget EmailTextField(context, controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Center(
          child: TextFormField(
        enableInteractiveSelection: true,
        autocorrect: false,
        enableSuggestions: false,
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: false,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: LIGHT_COLOR, width: 0.0),
          ),
          label: Text(
            "Email",
            style: TextStyle(color: LIGHT_COLOR),
          ),
          prefixIcon: Icon(Icons.email, color: LIGHT_COLOR),
        ),
        validator: (value) => validarEmail(value),
      )),
    );
  }

  Widget PasswordTextField(context, controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Center(
          child: TextFormField(
        enableInteractiveSelection: true,
        autocorrect: false,
        enableSuggestions: false,
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: LIGHT_COLOR, width: 0.0),
          ),
          label: Text(
            "Senha",
            style: TextStyle(color: LIGHT_COLOR),
          ),
          prefixIcon: Icon(Icons.lock_outline_rounded, color: LIGHT_COLOR),
        ),
        validator: (value) => validarSenha(value),
      )),
    );
  }

  Widget PasswordConfirmationTextField(context, controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Center(
          child: TextFormField(
        enableInteractiveSelection: true,
        autocorrect: false,
        enableSuggestions: false,
        controller: controller,
        style: TextStyle(color: Colors.white),
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: LIGHT_COLOR, width: 0.0),
          ),
          label: Text(
            "Confirme a Senha",
            style: TextStyle(color: LIGHT_COLOR),
          ),
          prefixIcon: Icon(Icons.lock_outline_rounded, color: LIGHT_COLOR),
        ),
        validator: (value) => validarSenhasIguais(value, _senhaController.text),
      )),
    );
  }
}

String? validarEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatorio";
  }

  String pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  if (!RegExp(pattern).hasMatch(value)) {
    return "Formato de email inválido";
  }

  return null;
}

String? validarSenha(String? value) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatorio";
  }

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
  if (!RegExp(pattern).hasMatch(value)) {
    print(value);
    return "A senha deve possuir no mínimo 8 caracteres, contendo ao menos uma letra maíuscula, minúscula, um número e um caractere especial (!@#*&)";
  }

  return null;
}

String? validarSenhasIguais(String? value, String pass) {
  if (value == null || value.isEmpty) {
    return "Campo obrigatorio";
  }

  if (!(value == pass)) {
    return "As senhas deve ser iguais";
  }

  return null;
}
