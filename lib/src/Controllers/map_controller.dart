import 'dart:convert';

import 'package:docicemergency2/src/Controllers/reports_controller.dart';
import 'package:docicemergency2/src/Services/ambulance_service.dart';
import 'package:docicemergency2/src/Services/maps_sevice.dart';
import 'package:docicemergency2/src/widgets/emergency_dialog.dart';
import 'package:docicemergency2/src/widgets/mySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:docicemergency2/src/Services/web_socket_service.dart';

class MapController extends GetxController {
  final CameraPosition cameraPositioninitiale = CameraPosition(
    target: LatLng(36.850, 10.165),
    zoom: 14,
  );

  late GoogleMapController _mapController;
  final socketService = WebSocketService();
  final ambulanceService = AmbulanceService();
  final MapsService mapsService = MapsService();
  final Map<PolylineId, Polyline> polylines = {};
  final Location _location = Location();
  final ReportsController reportsController = Get.put<ReportsController>(
    ReportsController(),
  );
  bool showItenerary = false;
  Marker? marker;
  List<LatLng> routePoints = [];

  @override
  void onInit() async {
    super.onInit();

    // _loadCustomMarker();
    await _initLocationTracking();
    connectionChnnel();
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  Future<void> _initLocationTracking() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) return;
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) return;
    }

    _location.onLocationChanged.listen((locationData) async {
      if (locationData.latitude == null || locationData.longitude == null)
        return;

      LatLng current = LatLng(locationData.latitude!, locationData.longitude!);
      try {
        if (reportsController.location != null) {
          routePoints = await mapsService.getRouteCoordinates(
            current,
            reportsController.location!,
          );
          showItenerary = true;
        }

        polylines[PolylineId("to_marker")] = Polyline(
          polylineId: PolylineId("to_marker"),
          color: Colors.orange,
          width: 5,
          points: routePoints,
        );

        update();
        _mapController.animateCamera(CameraUpdate.newLatLng(current));
      } catch (e) {
        print("Error getting polyline: $e");
        mySnackBar.show(message: "$e", title: 'error', isSuccess: false);
      }
    });
  }

  // ---------------------------------------- get the emregency after confirme--------------------

  void connectionChnnel() async {
    await socketService.connect(
      onMessage: (msg) {
        if (msg.contains("New emergency is waiting!!!")) {
          final data = jsonDecode(msg);
          int emergencyId = data['emergency_id'];
          showEmergencyDialog(
            onConfirm: () async {
              final result = await ambulanceService.confirmEmergency(
                emergencyId,
              );
              await reportsController.getEmergency();
              if (reportsController.location != null) {
                marker = Marker(
                  markerId: MarkerId('customMarker'),
                  position: reportsController.location!,
                  icon: BitmapDescriptor.defaultMarker,
                );
                update();
              }

              if (result) {
                mySnackBar.show(
                  message: "the emregncy has been accecpted ",
                  title: 'sucsess',
                  isSuccess: true,
                );
              } else {
                if (result) {
                  print("$result");
                  mySnackBar.show(
                    message: "we cant confirme the emergncy ",
                    title: 'error',
                    isSuccess: false,
                  );
                }
              }
            },
          );
        }
      },
    );
  }

Future <void> done()async{
  await reportsController.makeitdone();
  update();
  await socketService.connect(onMessage: (message) {
    "im  connection";
  },);
  
}


 
}
