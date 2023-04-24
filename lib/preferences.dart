import 'package:coinomy/home.dart';
import 'package:flutter/material.dart';

import 'global-constants.dart';

class Preferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: DARK_COLOR,
      ),
      child: Text('TELA DE CONFIGURAÇÕES'),
    );
  }
}
