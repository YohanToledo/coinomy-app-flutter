import 'package:coinomy/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              width: 100,
              height: MediaQuery.of(context).size.height * 1,
              color: DARK_COLOR,
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}

class CupertinoTabBarExample extends StatelessWidget {
  const CupertinoTabBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: Color.fromARGB(255, 35, 3, 80),
      tabBar: CupertinoTabBar(
        backgroundColor: Color.fromARGB(255, 35, 3, 80),
        border: Border.all(color: Color.fromARGB(255, 41, 160, 182)),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house,
              color: Color.fromARGB(255, 41, 160, 182),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add,
                color: Color.fromARGB(255, 41, 160, 182)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.ellipsis,
              color: Color.fromARGB(255, 41, 160, 182),
            ),
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: Text('Content of tab $index'),
            );
          },
        );
      },
    );
  }
}
