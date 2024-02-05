import 'package:flutter/material.dart';
import 'listScreen.dart';
import 'profileScreen.dart';
import 'blankScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigazione Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlankScreen(),
        '/profile': (context) => ProfileScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}
