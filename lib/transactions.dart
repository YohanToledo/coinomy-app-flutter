import 'package:coinomy/home.dart';
import 'package:coinomy/register.dart';
import 'package:coinomy/screens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global-constants.dart';
import 'login.dart';

const List<String> list = <String>[
  'Mercado',
  'Salario',
  'Rendimento',
  'Combustivel'
];

class Transactions extends StatefulWidget {
  @override
  State<Transactions> createState() => _Transactions();
}

class _Transactions extends State<Transactions> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 6),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: DARK_COLOR,
              child: ListView(children: <Widget>[
                Text(
                  'Receita',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                valueField(),
                TextField(
                  controller:
                      dateController, //editing controller of this TextField
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: LIGHT_COLOR,
                    )),
                    label: Text(
                      "Enter Date",
                      style: TextStyle(color: LIGHT_COLOR),
                    ),
                    icon: Icon(
                      Icons.calendar_today,
                      color: LIGHT_COLOR,
                    ),
                  ),

                  readOnly: true, // when true user cannot edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                      String formattedDate = DateFormat('dd/MM/yyyy').format(
                          pickedDate); // format date in required form here we use dd/MM/yyyy that means time is removed
                      print(formattedDate);

                      setState(() {
                        dateController.text =
                            formattedDate; //set foratted date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                descField(),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonField(),
                SizedBox(
                  height: 10,
                ),
                saveButton(),
              ]),
            ),
          ])),
    );
  }
}

Widget valueField() {
  return TextFormField(
      keyboardType: TextInputType.number,
      validator: (val) {
        if (val == 0) {
          return "Valor nao pode ser zero";
        } else {
          return null;
        }
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: LIGHT_COLOR,
        )),
        label: Text(
          "R\$",
          style: TextStyle(color: LIGHT_COLOR),
        ),
        icon: Icon(
          Icons.calculate,
          color: LIGHT_COLOR,
        ),
      ));
}

Widget descField() {
  return TextFormField(
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: LIGHT_COLOR,
        )),
        label: Text(
          "Descrição",
          style: TextStyle(color: LIGHT_COLOR),
        ),
        icon: Icon(
          Icons.calculate,
          color: LIGHT_COLOR,
        ),
      ));
}

class DropdownButtonField extends StatefulWidget {
  const DropdownButtonField({super.key});

  @override
  State<DropdownButtonField> createState() => _DropdownButtonState();
}

class _DropdownButtonState extends State<DropdownButtonField> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      alignment: Alignment.bottomLeft,
      dropdownColor: DARK_COLOR,
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_downward,
        color: LIGHT_COLOR,
      ),
      underline: Container(
        height: 0,
      ),
      elevation: 16,
      style: const TextStyle(color: LIGHT_COLOR),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

Widget saveButton() {
  return Container(
      height: 40,
      width: 100,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: ElevatedButton(
        child: const Text(
          'Salvar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, elevation: 5),
        onPressed: () {},
      ));
}
