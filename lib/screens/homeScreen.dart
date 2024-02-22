import 'package:flutter/material.dart';
import 'listScreen.dart';
import 'profileScreen.dart';
import 'blankScreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const BlankScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/list': (context) => const ListScreen(),
      },
    );
  }
}
