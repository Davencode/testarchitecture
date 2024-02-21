import 'package:flutter/material.dart';
import 'package:testarchitecture/screens/splash_screen.dart';

import 'package:flutter/material.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return Padding(
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
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Apri il Drawer
                  },
                  hoverColor: Colors.grey,
                  child: const Icon(Icons.menu),
                ),
                SizedBox(height: 16),
                FloatingActionButton.extended(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF0E5D6B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  onPressed: () {},
                  hoverColor: Colors.grey,
                  label: Text('Giro 7 Chiese'),
                ),
              ],
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 70,
              child: DrawerHeader(
                child: Text(
                  'Esplora ora',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Giubileo'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alla home
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('Pellegrino Pass'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('Rosario Digitale'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('Giochi'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('I miei ricordi'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('Il mio percorso'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('Negozio'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            ),
            ListTile(
              title: Text('Impostazioni'),
              onTap: () {
                // Aggiungi qui la logica per la navigazione alle impostazioni
                Navigator.pop(context); // Chiudi il Drawer
              },
            )
            // Aggiungi altri ListTile per altri elementi del menu
          ],
        ),
      ),
      body: Center(
        child: Text('Qui deve andare la mappa.'),
      ),
    );
  }
}
