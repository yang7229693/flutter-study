import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LYTable extends StatelessWidget {
  const LYTable();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Table"),
        leading: new BackButton(),
      ),
      body: new LYTableContent(),
    );
  }
}

class LYTableContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(50.0),
        1: FixedColumnWidth(100.0),
        2: FixedColumnWidth(50.0),
        3: FixedColumnWidth(100.0),
      },
      border: TableBorder.all(color: Colors.red, width: 1.0, style: BorderStyle.solid),
      children: const <TableRow>[
        TableRow(
          children: <Widget>[
            Text('A1'),
            Text('B1'),
            Text('C1'),
            Text('D1'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A2'),
            Text('B2'),
            Text('C2'),
            Text('D2'),
          ],
        ),
        TableRow(
          children: <Widget>[
            Text('A3'),
            Text('B3'),
            Text('C3'),
            Text('D3'),
          ],
        ),
      ],
    );
  }
}
