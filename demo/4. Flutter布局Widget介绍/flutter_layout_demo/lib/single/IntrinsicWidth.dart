import 'package:flutter/material.dart';

class LYIntrinsicWidth extends StatelessWidget {
  const LYIntrinsicWidth();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IntrinsicWidth"),
        leading: new BackButton(),
      ),
      body: new LYIntrinsicWidthContent(),
    );
  }
}

class LYIntrinsicWidthContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.green,
      padding: const EdgeInsets.all(5.0),
      child: new IntrinsicWidth(
        stepHeight: 450.0,
        stepWidth: 300.0,
        child: new Column(
          children: <Widget>[
            new Container(color: Colors.blue, height: 100.0),
            new Container(color: Colors.red, width: 150.0, height: 100.0),
            new Container(color: Colors.yellow, height: 150.0,),
          ],
        ),
      ),
    );
  }
}
