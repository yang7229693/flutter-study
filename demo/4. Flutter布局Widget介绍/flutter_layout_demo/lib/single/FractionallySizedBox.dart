import 'package:flutter/material.dart';

class LYFractionallySizedBox extends StatelessWidget {
  const LYFractionallySizedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("FractionallySizedBox"),
        leading: new BackButton(),
      ),
      body: new LYFractionallySizedBoxContent(),
    );
  }
}

class LYFractionallySizedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Container(
        color: Colors.blue,
        height: 150.0,
        width: 150.0,
        padding: const EdgeInsets.all(10.0),
        child: new FractionallySizedBox(
          alignment: Alignment.topLeft,
          widthFactor: 1.5,
          heightFactor: 0.5,
          child: new Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
