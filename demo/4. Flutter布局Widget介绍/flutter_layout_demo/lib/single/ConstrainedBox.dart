import 'package:flutter/material.dart';

class LYConstrainedBox extends StatelessWidget {
  const LYConstrainedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ConstrainedBox"),
        leading: new BackButton(),
      ),
      body: new LYConstrainedBoxContent(),
    );
  }
}

class LYConstrainedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 100.0,
        minHeight: 100.0,
        maxWidth: 150.0,
        maxHeight: 150.0,
      ),
      child: new Container(
        width: 200.0,
        height: 200.0,
        color: Colors.red,
      ),
    );
  }
}
