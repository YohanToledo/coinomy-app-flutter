import 'package:coinomy/global-constants.dart';
import 'package:coinomy/transactions.dart';
import 'package:coinomy/home.dart';
import 'package:coinomy/preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  Screens() : super();

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screens> {
  int currentTabIndex = 0;
  bool showTransactionOptions = false;

  List<Widget> tabs = [
    Home(),
    Container(), // Placeholder for Transactions screen
    Preferences(),
  ];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  showTransactionOptionsModal() {
    setState(() {
      showTransactionOptions = true;
    });
  }

  closeTransactionOptionsModal() {
    setState(() {
      showTransactionOptions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          tabs[currentTabIndex],
          if (showTransactionOptions)
            GestureDetector(
              onTap: closeTransactionOptionsModal,
              child: Container(
                color: Colors.black54,
              ),
            ),
          if (showTransactionOptions)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        closeTransactionOptionsModal();
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Transactions(
                              title: "RECEITA",
                              transactionId: 1,
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_upward),
                          Text("Receita"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        closeTransactionOptionsModal();
                        // Navigate to the Transactions screen and open the modal
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Transactions(
                              title: "DESPESA",
                              transactionId: 2,
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          Icon(Icons.arrow_downward),
                          Text("Despesa"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: NAV_BAR_COLOR,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home_filled,
                color: LIGHT_COLOR,
              ),
              onPressed: () => onTapped(0),
            ),
            SizedBox(), // Placeholder for the FloatingActionButton
            IconButton(
              icon: Icon(
                Icons.settings,
                color: LIGHT_COLOR,
              ),
              onPressed: () => onTapped(2),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LIGHT_COLOR,
        foregroundColor: DARK_COLOR,
        onPressed: showTransactionOptionsModal,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
