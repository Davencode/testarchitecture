import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Profilo'),
      ),
      body: Center(
        child: Text('Questa è la pagina del profilo.'),
      ),
    );
  }
}