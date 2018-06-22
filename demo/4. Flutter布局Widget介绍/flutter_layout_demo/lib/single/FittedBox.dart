import 'package:flutter/material.dart';

class LYFittedBox extends StatelessWidget {
  const LYFittedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FittedBox"),
        leading: new BackButton(),
      ),
      body: new LYFittedBoxContent(),
    );
  }
}

class LYFittedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.amberAccent,
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: new FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.center,
        child: new Container(
          color: Colors.red,
          child: new Text(
            "BoxFit.fill",
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
