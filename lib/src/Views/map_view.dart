import 'package:docicemergency2/src/Controllers/map_controller.dart';
import 'package:docicemergency2/src/widgets/emergency_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.find<MapController>();

    /*Future.delayed(Duration(seconds: 10), () async {
      var result = (await showEmergencyDialog());
      if (result != null && result![0] == true) {
        controller.showItenerary = true;
        controller.update();
      }
    });*/
    return GetBuilder<MapController>(
      builder: (controller) => Scaffold(
        body: GoogleMap(
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: controller.cameraPositioninitiale,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          polylines: controller.showItenerary
              ? Set<Polyline>.of(controller.polylines.values)
              : <Polyline>{},
        ),
      ),
    );
  }
}
