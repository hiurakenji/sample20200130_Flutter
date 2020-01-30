import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

class LoginPage extends StatelessWidget {
  //ユーザIDコントローラー
  final textController1 = TextEditingController();
  //パスワードコントローラー
  final textController2 = TextEditingController();
  //Formキー
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ログイン画面'),
      ),
      body: ListView(children: <Widget>[
        Form(
          key: _formKey,
          child: Container(
            padding: new EdgeInsets.all(32.0),
            child: new Center(
              child: new Column(
                children: <Widget>[
                  //イメージウィジェット
                  Image.asset('images/takefu.png'),
                  //ユーザIDテキストウィジェット
                  new TextFormField(
                    controller: textController1,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    decoration: const InputDecoration(
                      hintText: 'ユーザIDを入力してください。',
                      labelText: 'ユーザID',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '必須です。';
                      }
                      return null;
                    },
                  ),
                  //パスワードテキストウィジェット
                  new TextFormField(
                    controller: textController2,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    //入力値をマスク
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'パスワードを入力してください。',
                      labelText: 'パスワード',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '必須です。';
                      }
                      return null;
                    },
                  ),
                  //ログインボタンウィジェット
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        //認証
                        DocumentSnapshot docSnapshot = await Firestore.instance
                            .collection('user')
                            .document(textController1.text)
                            .get();
                        Map record = docSnapshot.data;

                        //認証成功
                        if (record != null &&
                            textController2.text == record['password']) {
                          //認証成功
                          User userinfo = User();
                          userinfo.userid = record['password'];
                          userinfo.username = record['name'];

                          Navigator.pushNamed(
                            context,
                            "/home3",
                            arguments: <String, User>{
                              'userinfo': userinfo,
                            },
                          );
                          return;
                        }
                        //認証失敗
                        else {
                          //ダイアログを表示
                          var result = await showDialog<int>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('認証エラー'),
                                content: Text('ユーザIDまたはパスワードが違います。'),
                                actions: <Widget>[
                                  RaisedButton(
                                    child: Text('OK'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(0),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.lightGreenAccent,
          height: 50,
          child: Center(
            child: Text("広告バナーを表示したい。。"),
          ),
        ),
      ),
    );
  }
}
