import 'package:flutter/material.dart';
import 'package:qrcodesample/history.dart';
import 'package:qrcodesample/scan.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [ScannerPage(), HistoryPage()];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            // ignore: deprecated_member_use
            title: new Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.history),
            //ignore: deprecated_member_use
            title: new Text("History"),
          ),
        ],
      ),
    );
  }
}
