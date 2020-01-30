import 'package:flutter/material.dart';
import 'package:flutter_app/import/import.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ja'),
      ],
      home: LoginPage(),
      routes: {
        'login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/home3': (context) => MyHomePage3(),
        '/home4': (context) => MyHomePage4(),
        '/registration': (context) => Registration(),
        '/main5': (context) => Main5(),
        '/main6': (context) => Main6(),
        '/main7': (context) => Main7(),
        '/main8': (context) => Main8(),
        '/err': (context) => ErrPage(),
      },
    );
  }
}
