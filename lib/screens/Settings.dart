import 'package:flutter/material.dart';
import 'MapView.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    const title = 'impostazioni';

    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        leading: Builder(builder: (context) {
          return InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MapView(),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white, // Colore del container
                borderRadius:
                    BorderRadius.circular(16), // Bordo arrotondato, opzionale
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.15), // Colore dell'ombra con opacità
                    spreadRadius: 4, // Distanza di diffusione dell'ombra
                    blurRadius: 6, // Raggio di sfocatura dell'ombra
                    offset:
                        Offset(0, 3), // Offset dell'ombra rispetto al container
                  ),
                ],
              ),
              child: Icon(
                Icons.chevron_left,
                size: 40.0,
                color: Color(0xFF0E5D6B),
              ),
              alignment: Alignment.center,
            ),
          );
        }),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Subscription'),
              trailing: Text('Free'),
            ),
            ListTile(
              title: Text('Lingua'),
              trailing: Text('Italiano'),
            ),
          ],
        ),
      ),
    );
  }
}
