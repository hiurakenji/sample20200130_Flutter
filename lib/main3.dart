//メニュー
import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

class MyHomePage3 extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyHomePage3> {
  var _city = 'カウントアップ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_city),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              setState(() => _city = 'DataTableサンプル');
              Navigator.pop(context);
              //
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() => _city = 'Columnサンプル');
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.mood),
            onPressed: () {
              setState(() => _city = 'アニメーション');
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: _buildBody(context),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('メニュー'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Image.asset('images/tobira.png'),
              title: Text('ログアウト'),
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
            ),
            ListTile(
              leading: Image.asset('images/cou.png'),
              title: Text('カウントアップ'),
              onTap: () {
                setState(() => _city = 'カウントアップ');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/en.png'),
              title: Text('詳細入力'),
              onTap: () {
                setState(() => _city = '詳細入力');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/risu.png'),
              title: Text('アニメーション'),
              onTap: () {
                setState(() => _city = 'アニメーション');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/risu.png'),
              title: Text('Rowサンプル'),
              onTap: () {
                setState(() => _city = 'Rowサンプル');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/risu.png'),
              title: Text('データ登録サンプル'),
              onTap: () {
                setState(() => _city = 'データ登録サンプル');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/risu.png'),
              title: Text('一覧表示サンプル'),
              onTap: () {
                setState(() => _city = '一覧表示サンプル');
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset('images/risu.png'),
              title: Text('tabメニューサンプル'),
              onTap: () {
                setState(() => _city = 'tabメニューサンプル');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    var aaa = _city;

    if (aaa == 'カウントアップ') {
      return MyHomePage();
    } else if (aaa == '詳細入力') {
      return Registration();
    } else if (aaa == 'アニメーション') {
      return MyHomePage4();
    } else if (aaa == 'Rowサンプル') {
      return Main5();
    } else if (aaa == 'データ登録サンプル') {
      return Main6();
    } else if (aaa == '一覧表示サンプル') {
      return Main7();
    } else if (aaa == 'tabメニューサンプル') {
      return Main8();
    }
  }
}
