// ignore_for_file: unused_local_variable

import 'package:docicemergency2/src/Controllers/map_controller.dart';
// import 'package:docicemergency2/src/Controllers/reports_controller.dart';
// import 'package:docicemergency2/src/widgets/emergency_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.find<MapController>();
    return GetBuilder<MapController>(
      builder: (controller) => Scaffold(
        floatingActionButton: controller.marker == null ? null : FloatingActionButton.extended(onPressed:() => controller.done() , label: Text('Done' ,style: Get.textTheme.labelMedium!
        .copyWith(color: Colors.white), ), icon: Icon(Icons.done, color: Colors.white,),),
        body: GoogleMap(
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: controller.cameraPositioninitiale,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
          markers: <Marker>{if (controller.marker != null) controller.marker!},
          polylines: controller.showItenerary
              ? Set<Polyline>.of(controller.polylines.values)
              : <Polyline>{},
        ),
      ),
    );
  }
}
