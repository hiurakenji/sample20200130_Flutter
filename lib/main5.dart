//rowサンプル
import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

class Main5 extends StatefulWidget {
  @override
  _Main5State createState() => _Main5State();
}

class _Main5State extends State<Main5> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Test1'),
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Test2'),
            color: Colors.yellow,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Test3'),
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
