import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

class ErrPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ErrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('エラー')),
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(children: <Widget>[
          Image.asset('images/err.png'),
          Text('エラー発生'),
        ]),
      ),
    );
  }
}
