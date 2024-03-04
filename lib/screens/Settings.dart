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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 80,
          leadingWidth: 100,
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
                margin: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white, // Colore del container
                  borderRadius:
                      BorderRadius.circular(18), // Bordo arrotondato, opzionale
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.12), // Colore dell'ombra con opacità
                      spreadRadius: 1, // Distanza di diffusione dell'ombra
                      blurRadius: 8, // Raggio di sfocatura dell'ombra
                      offset: Offset(
                          0, 0), // Offset dell'ombra rispetto al container
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Subscription'),
              trailing: Text('Free'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Email'),
              trailing: Text('account@email.it'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Lingua'),
              trailing: Text('Italiano'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
