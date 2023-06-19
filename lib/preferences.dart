import 'package:coinomy/preferencias/categoria.dart';
import 'package:coinomy/preferencias/minhaconta.dart';
import 'package:flutter/material.dart';

class Moeda {
  final String nome;
  final String simbolo;

  Moeda({required this.nome, required this.simbolo});
}

class Preferences extends StatelessWidget {
  final List<Moeda> moedas = [
    Moeda(nome: 'Dólar', simbolo: 'USD'),
    Moeda(nome: 'Euro', simbolo: 'EUR'),
    Moeda(nome: 'Real', simbolo: 'BRL'),
    Moeda(nome: 'Guarani', simbolo: 'PYG'),
    Moeda(nome: 'Iene', simbolo: 'JPY'),
    Moeda(nome: 'Dólar Australiano', simbolo: 'AUD'),
    Moeda(nome: 'Pesos', simbolo: 'ARS'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 6),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromARGB(190, 0, 32, 47), // Nova cor de fundo
              child: ListView(
                children: <Widget>[
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
                  SizedBox(height: 15), // Espaçamento adicional
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MinhaConta()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.grey,
                    ),
                    child: OptionCard(
                      context,
                      'Minha conta',
                      Icons.person,
                    ),
                  ),
                  SizedBox(height: 15), // Espaçamento adicional
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Privacidade()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.grey,
                    ),
                    child: OptionCard(
                      context,
                      'Privacidade',
                      Icons.lock,
                    ),
                  ),
                  SizedBox(height: 15), // Espaçamento adicional

                  SizedBox(height: 15), // Espaçamento adicional

                  SizedBox(height: 15), // Espaçamento adicional
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Categoria()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.grey,
                    ),
                    child: OptionCard(
                      context,
                      'Categoria',
                      Icons.category,
                    ),
                  ),
                  SizedBox(height: 15), // Espaçamento adicional
                  ElevatedButton(
                    onPressed: () {
                      // Ação do botão "Voltar"
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      primary: Colors.grey,
                    ),
                    child: OptionCard(
                      context,
                      'Voltar',
                      Icons.arrow_back,
                    ),
                  ),
                  SizedBox(height: 15), // Espaçamento adicional
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Privacidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacidade'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Lógica para resetar conta
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Resetar Conta'),
                      content: Text('Deseja realmente resetar sua conta?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Lógica para resetar conta
                            Navigator.pop(context);
                            // Exibir mensagem de sucesso ou redirecionar para a tela inicial, por exemplo
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Não'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Resetar Conta'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para apagar conta
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Apagar Conta'),
                      content: Text('Deseja realmente apagar sua conta?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Lógica para apagar conta
                            Navigator.pop(context);
                            // Exibir mensagem de sucesso ou redirecionar para a tela inicial, por exemplo
                          },
                          child: Text('Sim'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Não'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Apagar Conta'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

Widget OptionCard(context, String nameLabel, IconData icones) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    height: 50,
    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
    margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color:
          Color.fromARGB(255, 0, 32, 47), // Alterado para a nova cor de fundo
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          icones,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          nameLabel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
