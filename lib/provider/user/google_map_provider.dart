import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapProvider extends ChangeNotifier {
  late GoogleMapController mapConttroller;

  Map<String, Marker> _markers = {};
  Map<String, Marker> get markers => _markers;

  addMarker(String id, LatLng location) {
    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
          title: 'marker $id',
          snippet: location.toString(),
        ));
    _markers[id] = marker;
    notifyListeners();
  }
}
