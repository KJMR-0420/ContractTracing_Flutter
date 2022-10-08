import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Name"),
                subtitle: Text("Subname"),
                leading: CircleAvatar(
                  child: Image(
                    image: AssetImage(""),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
