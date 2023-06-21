// ignore_for_file: prefer_const_constructors

import 'package:coinomy/db/database_helper.dart';
import 'package:coinomy/db/transactions_datasource.dart';
import 'package:coinomy/global-constants.dart';
import 'package:coinomy/model/transaction_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TransactionsSQLiteDatasource _transactionsDatasource =
      TransactionsSQLiteDatasource();
  TextEditingController _valueController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;
  String _category = "";

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
                  controller: _valueController,
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                    CurrencyInputFormatter(),
                  ],
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
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        _dateController.text =
                            DateFormat('dd/MM/yyyy').format(selectedDate!);
                      });
                    }
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _descriptionController,
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
                  dropdownColor: NAV_BAR_COLOR,
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
                  items: const [
                    DropdownMenuItem<String>(
                      value: 'mercado',
                      child: Text(
                        'Mercado',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'salario',
                      child: Text(
                        'Salario',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: 'combustivel',
                      child: Text(
                        'Combustivel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _category = val!;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    String? value = _valueController.text.replaceAll(",", "");
                    DateTime date = selectedDate ?? DateTime.now();
                    String? description = _descriptionController.text;
                    String? category = _category;

                    if (isValidFields(value, date, description, category)) {
                      TransactionEntity newTransaction = TransactionEntity(
                        type: widget.title,
                        value: double.parse(value),
                        description: description,
                        date: date,
                        category: category,
                      );

                      print(newTransaction.toMap());
                    }

                    Navigator.pop(context);
                    // int insertedId = await _transactionsDatasource
                    //     .insertTransaction(newTransaction);
                  },
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidFields(value, date, description, category) {
    if (value == null || value == "") {
      return false;
    }

    if (date == null || date == "") {
      return false;
    }

    if (description == null || description == "") {
      return false;
    }

    if (category == null || category == "") {
      return false;
    }

    return true;
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String numericValue = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (numericValue.length >= 2) {
      String wholeNumber = numericValue.substring(0, numericValue.length - 2);
      String decimalPart = numericValue.substring(numericValue.length - 2);

      String formattedWholeNumber = '';
      for (int i = wholeNumber.length - 1, count = 0; i >= 0; i--, count++) {
        if (count == 3) {
          formattedWholeNumber = ',' + formattedWholeNumber;
          count = 0;
        }
        formattedWholeNumber = wholeNumber[i] + formattedWholeNumber;
      }

      String formattedValue = '$formattedWholeNumber.$decimalPart';

      String finalValue = formattedValue;

      return TextEditingValue(
        text: finalValue,
        selection: TextSelection.collapsed(offset: finalValue.length),
      );
    }

    return newValue;
  }
}
