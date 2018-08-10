import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYIndexedStack extends StatelessWidget {
  const LYIndexedStack();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("IndexedStack"),
        leading: new BackButton(),
      ),
      body: new LYIndexedStackContent(),
    );
  }
}

class LYIndexedStackContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: IndexedStack(
        index: 1,
        alignment: const Alignment(0.6, 0.6),
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/pic.jpg'),
            radius: 100.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            child: Text(
              'Mia B',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
