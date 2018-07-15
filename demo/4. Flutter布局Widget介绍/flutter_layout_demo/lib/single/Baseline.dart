import 'package:flutter/material.dart';

class LYBaseline extends StatelessWidget {
  const LYBaseline();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Baseline"),
        leading: new BackButton(),
      ),
      body: new LYBaselineContent(),
    );
  }
}

class LYBaselineContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Baseline(
          baseline: 50.0,
          baselineType: TextBaseline.alphabetic,
          child: new Text(
            'TjTjTj',
            style: new TextStyle(
              fontSize: 16.0,
              textBaseline: TextBaseline.alphabetic,
            ),
          ),
        ),
        new Baseline(
          baseline: 50.0,
          baselineType: TextBaseline.alphabetic,
          child: new Container(
            width: 30.0,
            height: 30.0,
            color: Colors.red,
          ),
        ),
        new Baseline(
          baseline: 50.0,
          baselineType: TextBaseline.alphabetic,
          child: new Text(
            'RyRyRy',
            style: new TextStyle(
              fontSize: 35.0,
            ),
          ),
        ),
      ],
    );
  }
}
