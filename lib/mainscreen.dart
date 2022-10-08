import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:qrcodesample/history.dart';
import 'package:qrcodesample/scan.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: 'Qr Code Scanner',
      home: MyBottomNavigationBar(),
    );
  }
}

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
    return Scaffold(
      appBar: AppBar(
        title: Text("QR CODE SCANNER"),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              title: Text("Scan"),
              backgroundColor: Colors.lightBlue[200]),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text("History"),
              backgroundColor: Colors.lightBlue[300]),
        ],
      ),
    );
  }
}
