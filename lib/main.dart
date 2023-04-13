import 'package:coinomy/register.dart';
import 'package:flutter/material.dart';

const double FONT_TITLE_SIZE = 20;
const Color LIGHT_COLOR = Color.fromARGB(255, 41, 160, 182);
const Color DARK_COLOR = Color.fromARGB(255, 35, 3, 80);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //appBar: AppBar(title: const Text('LOGIN')),
        body: _Login(),
      ),
    );
  }
}

class _Login extends StatelessWidget {
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
                    'Não possui uma conta? Crie agora mesmo!',
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
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

/*
 enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: LIGHT_COLOR,
                                ),
                              )

*/

/*
 Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'e-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                cursorColor: Color.fromARGB(255, 94, 14, 14),
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Esqueci a senha',
              ),
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) {
                //  return recuperarsenha();
                //}));
              },
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    //Navigator.push(context,
                    //    MaterialPageRoute(builder: (context) {
                    //  return MenuPrincipal();
                    //}));
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Não possui conta?'),
                TextButton(
                  child: const Text(
                    'Cadastre aqui',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    print('Cadastro aqui');
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
*/
