import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './mainscreen.dart';

void main() => runApp(QrcodeApp());

class QrcodeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showSemanticsDebugger: false,
      title: "Qr Code Scanner",
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  const IndexPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/image/final.jpg"), fit: BoxFit.cover),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 380.0,
            height: 100.0,
            child: RaisedButton(
              color: Colors.transparent,
              splashColor: Colors.lightBlue[100],
              highlightElevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.lightBlue[900]),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              child: Container(
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.black, fontSize: 30.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
