import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {

  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina con Liste'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Elemento 1'),
          ),
          ListTile(
            title: Text('Elemento 2'),
          ),
          ListTile(
            title: Text('Elemento 3'),
          ),
        ],
      ),
    );
  }
}
