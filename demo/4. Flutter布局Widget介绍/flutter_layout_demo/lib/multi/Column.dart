import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYColumn extends StatelessWidget {
  const LYColumn();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Column"),
        leading: new BackButton(),
      ),
      body: new LYColumnContent(),
    );
  }
}

class LYColumnContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.red,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 2,
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(5.0),
          ),
          flex: 1,
        ),
      ],
    );
  }
}