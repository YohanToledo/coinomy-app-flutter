import 'package:coinomy/global-constants.dart';
import 'package:coinomy/_transactions.dart';
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
                        // Navigate to the Transactions screen and open the modal
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Transactions(
                              title: "RECEITA",
                              transactionId: 1,
                            ),
                          ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Transactions(
                              title: "DESPESA",
                              transactionId: 2,
                            ),
                          ),
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

// class Screens extends StatefulWidget {
//   Screens() : super();

//   @override
//   _ScreenState createState() => _ScreenState();
// }

// class _ScreenState extends State<Screens> {
//   int currentTabIndex = 0;
//   List<Widget> tabs = [
//     Home(),
//     Container(), // Placeholder for Transactions modal
//     Preferences()
//   ];

//   onTapped(int index) {
//     setState(() {
//       currentTabIndex = index;
//     });

//     if (index == 1) {
//       showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         builder: (BuildContext context) => Container(
//           height: MediaQuery.of(context).size.height * 0.8,
//           color: Colors.transparent,
//           child: Transactions(
//             title: "RECEITA",
//             transactionId: 1,
//             // onSave: (transaction) {
//             //   // Implement your save logic here
//             //   Navigator.pop(context); // Close the modal
//             // },
//           ),
//         ),
//       ).then((value) {
//         // Handle modal closure
//         setState(() {
//           currentTabIndex = 0; // Reset to the first tab
//         });
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: tabs[currentTabIndex],
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           //border: Border(top: BorderSide(color: LIGHT_COLOR, width: 1.0)),
//         ),
//         child: BottomNavigationBar(
//           onTap: onTapped,
//           currentIndex: currentTabIndex,
//           showSelectedLabels: false,
//           showUnselectedLabels: true,
//           backgroundColor: NAV_BAR_COLOR,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.home,
//                 color: LIGHT_COLOR,
//               ),
//               label: "",
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 Icons.add_circle_outline,
//                 color: LIGHT_COLOR,
//               ),
//               label: "",
//               backgroundColor: DARK_COLOR,
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(
//                 CupertinoIcons.ellipsis,
//                 color: LIGHT_COLOR,
//               ),
//               label: "",
//               backgroundColor: DARK_COLOR,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
