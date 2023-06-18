import 'package:flutter/material.dart';

class Moeda {
  final String nome;
  final String simbolo;

  Moeda({required this.nome, required this.simbolo});
}

class MoedaPage extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('Moedas'),
      ),
      body: ListView.builder(
        itemCount: moedas.length,
        itemBuilder: (context, index) {
          final moeda = moedas[index];
          return ListTile(
            title: Text(moeda.nome),
            subtitle: Text(moeda.simbolo),
            onTap: () {
              // Ação ao clicar em uma moeda
              print('Moeda selecionada: ${moeda.nome}');
            },
          );
        },
      ),
    );
  }
}
