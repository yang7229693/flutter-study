import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYGridView extends StatelessWidget {
  const LYGridView();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView"),
        leading: new BackButton(),
      ),
      body: new LYGridViewContent(),
    );
  }
}

class LYGridViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      width: 200.0,
      height: 300.0,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          100,
              (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            );
          },
        ),
      ),
    );
  }
}
