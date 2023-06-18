import 'package:flutter/material.dart';

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
