import 'package:coinomy/home.dart';
import 'package:coinomy/register.dart';
import 'package:coinomy/screens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global-constants.dart';
import 'login.dart';

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
                )
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

Widget dateSelect() {
  return TextField();
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Datepicker")),
        body: Container(
            padding: const EdgeInsets.all(15),
            height: 150,
            child: Center(
                child: TextField(
              controller: dateController, //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //label text of field
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
                  String formattedDate = DateFormat('yyyy-MM-dd').format(
                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(
                      formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need

                  setState(() {
                    dateController.text =
                        formattedDate; //set foratted date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ))));
  }
}
