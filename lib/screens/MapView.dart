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

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomLeft,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton.extended(
            backgroundColor: Colors.white,
            foregroundColor: Color(0xFF0E5D6B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            onPressed: () {
              _toggle();
            },
            hoverColor: Colors.grey,
            label: Text('Giro 7 Chiese'),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: AppColors.primaryColor,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.onPressed,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: const Color(0xFF0E5D6B),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (3.141592653589793 / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          left: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * 3.141592653589793 / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}
