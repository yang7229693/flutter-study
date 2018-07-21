import 'package:flutter/material.dart';

class LYLimitedBox extends StatelessWidget {
  const LYLimitedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("LimitedBox"),
        leading: new BackButton(),
      ),
      body: new LYLimitedBoxContent(),
    );
  }
}

class LYLimitedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          color: Colors.red,
          width: 100.0,
        ),
        LimitedBox(
//          maxWidth: 150.0,
          child: Container(
            color: Colors.blue,
            width: 250.0,
          ),
        ),
      ],
    );
  }
}
