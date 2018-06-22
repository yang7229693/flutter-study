import 'package:flutter/material.dart';

class LYAlign extends StatelessWidget {
  const LYAlign();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Align"),
        leading: new BackButton(),
      ),
      body: new LYAlignContent(),
    );
  }
}

class LYAlignContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.red,
      child: new Align(
        alignment: const Alignment(1.0, 0.5),
        widthFactor: 3.0,
        heightFactor: 3.0,
        child: new Container(
          child: new Text("Align"),
          color: Colors.amber,
        ),
      ),
    );
  }
}
