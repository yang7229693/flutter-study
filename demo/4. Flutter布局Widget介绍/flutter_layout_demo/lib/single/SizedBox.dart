import 'package:flutter/material.dart';

class LYSizedBox extends StatelessWidget {
  const LYSizedBox();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SizedBox"),
        leading: new BackButton(),
      ),
      body: new LYSizedBoxContent(),
    );
  }
}

class LYSizedBoxContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: Container(
          color: Colors.red,
          width: 100.0,
          height: 300.0,
        ),
      ),
    );
  }
}
