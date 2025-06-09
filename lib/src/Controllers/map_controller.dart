import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapController extends GetxController {
  final CameraPosition cameraPositioninitiale = CameraPosition(target: LatLng(36.700067, 10.278099), zoom: 15);
  late GoogleMapController _mapController;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }
}