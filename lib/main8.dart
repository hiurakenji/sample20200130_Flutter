//タブメニュー画面
import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

class Main8 extends StatefulWidget {
  @override
  _Main8State createState() => _Main8State();
}

class _Main8State extends State<Main8> {
  @override
  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
    return DefaultTabController(
      // タブの数
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            // タブのオプション
            isScrollable: true,
            unselectedLabelColor: Colors.white.withOpacity(0.3),
            unselectedLabelStyle: TextStyle(fontSize: 12.0),
            labelColor: Colors.yellowAccent,
            labelStyle: TextStyle(fontSize: 16.0),
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            // タブに表示する内容
            tabs: [
              Tab(
                child: Text('Top'),
              ),
              Tab(
                child: Text('Business'),
              ),
              Tab(
                child: Text('Technology'),
              ),
              Tab(
                child: Text('Finance'),
              ),
              Tab(
                child: Text('Food'),
              ),
              Tab(
                child: Text('Economic'),
              ),
              Tab(
                child: Text('Game'),
              )
            ],
          ),
        ),
        body: TabBarView(
          // 各タブの内容
          children: [
            MyHomePage(),
            Registration(),
            Main7(),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_car)
          ],
        ),
      ),
    );
  }
}
