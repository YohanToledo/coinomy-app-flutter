// ignore_for_file: prefer_const_constructors

import 'package:coinomy/global-constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transactions extends StatefulWidget {
  final String title;
  final int transactionId;
  final String? transactionValue;
  final String? transactionDate;
  final String? transactionDescription;
  final String? transactionBank;

  Transactions({
    required this.title,
    required this.transactionId,
    this.transactionValue,
    this.transactionDate,
    this.transactionDescription,
    this.transactionBank,
  });

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 22, 32),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.title.toUpperCase() == 'RECEITA'
                          ? Colors.green
                          : Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Valor',
                    prefixIcon: Icon(Icons.calculate, color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Data',
                    prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  controller: _dateController,
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    final DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (selectedDate != null) {
                      final formattedDate =
                          DateFormat('dd/MM/yyyy').format(selectedDate);
                      setState(() {
                        _dateController.text =
                            formattedDate; // Update the field value
                      });
                    }
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    prefixIcon: Icon(Icons.edit, color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Categoria',
                    prefixIcon: Icon(Icons.tag, color: Colors.white),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(190, 0, 255, 255)),
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'item1',
                      child: Container(
                        color:
                            DARK_COLOR, // Set the background color of the item
                        child: Text(
                          'Item 1',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'item2',
                      child: Container(
                        color:
                            DARK_COLOR, // Set the background color of the item
                        child: Text(
                          'Item 2',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'item3',
                      child: Container(
                        color:
                            DARK_COLOR, // Set the background color of the item
                        child: Text(
                          'Item 3',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                  onChanged: (val) {},
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
