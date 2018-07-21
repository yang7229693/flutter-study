import 'package:flutter/material.dart';

class LYOverflowBox extends StatelessWidget {
  const LYOverflowBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("OverflowBox"),
        leading: new BackButton(),
      ),
      body: new LYOverflowBoxContent(),
    );
  }
}

class LYOverflowBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 200.0,
      height: 200.0,
      padding: const EdgeInsets.all(5.0),
      child: OverflowBox(
        alignment: Alignment.topLeft,
        maxWidth: 300.0,
        maxHeight: 300.0,
        minWidth: 250.0,
        minHeight: 250.0,
        child: Container(
          color: Color(0x33FF00FF),
          width: 200.0,
          height: 200.0,
        ),
      ),
    );
  }
}
