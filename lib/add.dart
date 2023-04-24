import 'package:coinomy/global-constants.dart';
import 'package:coinomy/home.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: DARK_COLOR,
      ),
      child: Text('Adicionar Transações'),
    );
  }
}
