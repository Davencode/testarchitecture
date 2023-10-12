import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {

  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Blank'),
      ),
      body: Center(
        child: Text('Questa è una pagina vuota.'),
      ),
    );
  }
}