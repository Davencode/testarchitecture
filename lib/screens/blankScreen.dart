import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'locations.dart' as locations;

class BlankScreen extends StatefulWidget {
  const BlankScreen({Key? key}) : super(key: key);


  @override
  State<BlankScreen> createState() => _BlankScreenState();
}

class _BlankScreenState extends State<BlankScreen> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();
      for (final office in googleOffices.offices) {
        final marker = Marker(
          markerId: MarkerId(office.name),
          position: LatLng(office.lat, office.lng),
          infoWindow: InfoWindow(
            title: office.name,
            snippet: office.address,
          ),
        );
        _markers[office.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FloatingActionButton(
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
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton.extended(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF0E5D6B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      onPressed: () {},
                      hoverColor: Colors.grey,
                      label: Text('Giro 7 Chiese'),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 70,
                child: DrawerHeader(
                  child: Text(
                    'Esplora ora',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ),
              ListTile(
                title: const Text('Giubileo'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alla home
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('Pellegrino Pass'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alle impostazioni
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('Rosario Digitale'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alle impostazioni
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('Giochi'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alle impostazioni
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('I miei ricordi'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alle impostazioni
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('Il mio percorso'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alle impostazioni
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('Negozio'),
                onTap: () {
                  // Aggiungi qui la logica per la navigazione alle impostazioni
                  Navigator.pop(context); // Chiudi il Drawer
                },
              ),
              ListTile(
                title: const Text('Impostazioni'),
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
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: LatLng(0, 0),
              zoom: 2,
            ),
            markers: _markers.values.toSet(),
            myLocationButtonEnabled: false
          ),
        ),
      ),
    );
  }
}


