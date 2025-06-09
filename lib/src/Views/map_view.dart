import 'package:docicemergency2/src/Controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(
      builder: (controller) => Scaffold(
         body: GoogleMap(
        onMapCreated: controller.onMapCreated,
        initialCameraPosition:controller.cameraPositioninitiale,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
      ),
      ));
  }
}