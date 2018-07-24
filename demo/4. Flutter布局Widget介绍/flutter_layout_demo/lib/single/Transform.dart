import 'package:flutter/material.dart';

class LYTransform extends StatelessWidget {
  const LYTransform();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Transform"),
        leading: new BackButton(),
      ),
      body: new LYTransformContent(),
    );
  }
}

class LYTransformContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        child: Transform(
          origin: Offset.zero,
          alignment: Alignment.topLeft,
          transform: Matrix4.rotationZ(0.3),
          child: Container(
            color: Colors.blue,
            width: 100.0,
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
