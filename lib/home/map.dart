import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  final LatLng location;
  const MapSample({required this.location, super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    final CameraPosition placeLocation = CameraPosition(
      target: widget.location,
      zoom: 15,
    );
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: placeLocation,
      markers: {
        Marker(markerId: const MarkerId('pin'), position: widget.location)
      },
      myLocationButtonEnabled: false,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
