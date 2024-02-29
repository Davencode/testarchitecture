import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testarchitecture/screens/Settings.dart';
import 'package:testarchitecture/screens/profileScreen.dart';
import 'package:testarchitecture/theme/colors.dart';
import 'locations.dart' as locations;

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
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
    return Scaffold(
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const ProfileScreen(),
                  ),
                ); // Chiudi il Drawer
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
                // Aggiungi qui la logica per la navigazione alla home
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => const SettingsView(),
                  ),
                ); // Chiudi il Drawer
              },
            )
            // Aggiungi altri ListTile per altri elementi del menu
          ],
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
                zoom: 2,
              ),
              markers: _markers.values.toSet(),
              myLocationButtonEnabled: false),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Builder(builder: (context) {
                      return FloatingActionButton(
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
                      );
                    }),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: ExpandableFab(
                        distance: 110,
                        children: [
                          ActionButton(
                            onPressed: () {},
                            icon: const Icon(Icons.pin_drop),
                          ),
                          ActionButton(
                            onPressed: () {},
                            icon: const Icon(Icons.pets),
                          ),
                          ActionButton(
                            onPressed: () {},
                            icon: const Icon(Icons.accessible),
                          ),
                          ActionButton(
                            onPressed: () {},
                            icon: const Icon(Icons.family_restroom),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
