import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:glossy_flossy/provider/user/google_map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

const LatLng currentLocation = LatLng(51.5742, 0.4857);

// ignore: must_be_immutable
class MapScreen extends StatelessWidget {
  MapScreen({super.key});

  Future<Position> _determinePosiition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GoogleMapProvider>(
      builder: (context, mapProvider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Position position = await _determinePosiition();
              mapProvider.mapConttroller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14,
                  ),
                ),
              );
              mapProvider.markers.clear();
              mapProvider.addMarker('current location',
                  LatLng(position.latitude, position.longitude));
            },
            child: Icon(Icons.location_on_outlined),
          ),
          body: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: currentLocation, zoom: 14),
            onMapCreated: (controller) {
              mapProvider.mapConttroller = controller;
              mapProvider.addMarker('test', currentLocation);
            },
            markers: mapProvider.markers.values.toSet(),
            mapToolbarEnabled: true,
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
          ),
        );
      },
    );
  }
}
