import 'package:flutter/material.dart';
import 'package:testarchitecture/screens/splash_screen.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SplashScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0E5D6B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          onPressed: () {},
          hoverColor: Colors.grey,
          child: const Icon(Icons.menu),
        ),
      ),
      /*appBar: AppBar(
        title: Text('Pagina Blank'),
      ),*/
      body: Center(
        child: Text('Questa è una pagina vuota.'),
      ),
    );
  }
}
