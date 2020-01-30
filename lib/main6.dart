//データ登録更新削除
import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';
import 'package:intl/intl.dart';

class Main6 extends StatefulWidget {
  @override
  _Main6State createState() => _Main6State();
}

class _Main6State extends State<Main6> {
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: new Center(
              child: new Column(
                children: <Widget>[
                  new TextFormField(
                    controller: textController3,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    decoration: const InputDecoration(
                      hintText: 'キーを入力してください。',
                      labelText: 'キー',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return '必須です。';
                      }
                      return null;
                    },
                  ),
                  new TextFormField(
                    controller: textController1,
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                    decoration: const InputDecoration(
                      hintText: '名前を入力してください。',
                      labelText: '名前',
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
                      child: Text('登録'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          Map data = {
                            "pkey": textController3.text,
                            "name": textController1.text,
                            "password": textController2.text,
                          };
                          String collectionStr = "user";
                          try {
                            setDatas(collectionStr, data);
                          } catch (e, stackTrace) {
                            print(e); //Bad state: the door is locked
                            print(stackTrace); //スタックトレース
                          }
                        }
                      }),
                  RaisedButton(
                      child: Text('更新'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          Map data = {
                            "pkey": textController3.text,
                            "name": textController1.text,
                            "password": textController2.text,
                          };
                          String collectionStr = "user";
                          try {
                            setUpds(collectionStr, data);
                          } catch (e) {
                            print(e);
                          }
                        }
                      }),
                  RaisedButton(
                      child: Text('削除'),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          Map data = {
                            "pkey": textController3.text,
                            "name": textController1.text,
                            "password": textController2.text,
                          };
                          String collectionStr = "user";
                          try {
                            setDels(collectionStr, data);
                            var www = double.parse("sssss");
                          } catch (e, stackTrace) {
                            print(e.toString());
                            print(stackTrace.toString());

                            String collectionStr = "CLT_LOG";
                            try {
                              setError(collectionStr, e, stackTrace);
                              Navigator.pushNamed(
                                context,
                                "/err",
                              );
                            } catch (e, stackTrace) {
                              print(e); //Bad state: the door is locked
                              print(stackTrace); //スタックトレース
                            }
                          }
                        }
                      }),
                  RaisedButton(
                      child: Text('取得'),
                      onPressed: () async {
                        Map data = {
                          "pkey": textController3.text,
                          "name": textController1.text,
                          "password": textController2.text,
                        };
                        String collectionStr = "user";
                        DocumentSnapshot docSnapshot = await Firestore.instance
                            .collection(collectionStr)
                            .document(data["pkey"])
                            .get();
                        Map record = docSnapshot.data;
                        textController3.text = record['pkey'];
                        textController1.text = record['name'];
                        textController2.text = record['password'];
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//登録
void setDatas(String collection, Map data) {
  Firestore.instance
      .collection(collection)
      .document(data["pkey"])
      .setData({"name": data["name"], "password": data["password"]});
}

//更新
void setUpds(String collection, Map data) {
  Firestore.instance
      .collection(collection)
      .document(data["pkey"])
      .updateData({"name": data["name"], "password": data["password"]});
}

//削除
void setDels(String collection, Map data) {
  Firestore.instance.collection(collection).document(data["pkey"]).delete();
}

//err登録
void setError(collection, e, stackTrace) {
  Firestore.instance
      .collection(collection)
      .document(DateFormat('yyyyMMddHHmmss').format(DateTime.now()))
      .setData({
    "date": DateFormat('yyyyMMddHHmmss').format(DateTime.now()).toString(),
    "msg1": e.toString(),
    "msg2": stackTrace.toString()
  });
}
