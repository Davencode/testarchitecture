import 'package:flutter/material.dart';
import 'package:testarchitecture/screens/splash_screen.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SplashScreen(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 30, left: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF0E5D6B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              onPressed: () {},
              hoverColor: Colors.grey,
              child: const Icon(Icons.menu),
            ),
            SizedBox(height: 16), // Aggiungi spazio tra i due FABs
            FloatingActionButton.extended(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF0E5D6B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              onPressed: () {},
              hoverColor: Colors.grey,
              label: Text('Percorso'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Qui deve andare la mappa.'),
      ),
    );
  }

}
