import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
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

  //place api for testing address filtering:----------------------------------
  // Add your state variables here
  String kGoogleApiKey = 'AIzaSyAMvEs5gM0HkkgWB0c4CkAgf9KLfYhMcyQ';
  late GoogleMapController googleMapController;
  final Mode _mode = Mode.overlay;
  Mode get mode => _mode;
  

  // Methods to update the state can be added here

  // Example method to update the apiKey
  void updateApiKey(GoogleMapController controller) {
    googleMapController = controller;
    notifyListeners(); // Notify listeners when state changes
  }
  
  //place api for testing address filtering:----------------------------------
}
