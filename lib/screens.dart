import 'package:coinomy/home.dart';
import 'package:coinomy/preferences.dart';
import 'package:coinomy/transactions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global-constants.dart';

class Screens extends StatefulWidget {
  Screens() : super();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screens> {
  int currentTabIndex = 0;
  List<Widget> tabs = [Home(), Transactions(), Preferences()];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[currentTabIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: LIGHT_COLOR, width: 1.0))),
          child: BottomNavigationBar(
            onTap: onTapped,
            currentIndex: currentTabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: true,
            backgroundColor: DARK_COLOR,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: LIGHT_COLOR,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: LIGHT_COLOR,
                  ),
                  label: "",
                  backgroundColor: DARK_COLOR),
              BottomNavigationBarItem(
                  icon: Icon(
                    CupertinoIcons.ellipsis,
                    color: LIGHT_COLOR,
                  ),
                  label: "",
                  backgroundColor: DARK_COLOR),
            ],
          ),
        ));
  }
}
