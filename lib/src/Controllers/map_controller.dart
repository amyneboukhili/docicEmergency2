import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final CameraPosition cameraPositioninitiale = CameraPosition(
    target: LatLng(36.850, 10.165),
    zoom: 14,
  );
  late GoogleMapController _mapController;

  bool showItenerary = false;

  // Polyline collection
  final Map<PolylineId, Polyline> polylines = {};

  @override
  void onInit() {
    super.onInit();
    // Load and parse GeoJSON data here or call a method to do it
    _addRoutePolyline();
  }

  void onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _addRoutePolyline() {
    // Paste your GeoJSON coordinates here (only coordinates array)
    final List<List<double>> coordinates = [
      [10.170229, 36.848622],
      [10.170154, 36.848636],
      [10.170001, 36.848665],
      [10.169779, 36.848742],
      [10.169592, 36.848826],
      [10.169579, 36.848856],
      [10.16984, 36.849257],
      [10.170085, 36.849692],
      [10.170361, 36.850265],
      [10.170498, 36.850652],
      [10.170661, 36.851231],
      [10.170701, 36.851431],
      [10.170748, 36.851863],
      [10.170715, 36.852228],
      [10.170663, 36.852509],
      [10.170496, 36.85299],
      [10.17041, 36.853338],
      [10.170424, 36.853381],
      [10.17041, 36.853454],
      [10.170353, 36.853514],
      [10.170312, 36.853533],
      [10.170219, 36.853544],
      [10.170101, 36.853647],
      [10.169961, 36.853811],
      [10.169081, 36.854974],
      [10.168292, 36.855929],
      [10.167076, 36.857202],
      [10.166989, 36.857364],
      [10.166977, 36.857478],
      [10.166985, 36.857498],
      [10.166996, 36.85758],
      [10.166972, 36.85766],
      [10.166915, 36.857728],
      [10.166834, 36.857778],
      [10.166736, 36.857803],
      [10.166698, 36.857806],
      [10.166574, 36.857851],
      [10.166463, 36.857916],
      [10.166377, 36.857993],
      [10.165963, 36.858506],
      [10.165654, 36.858844],
      [10.165432, 36.859044],
      [10.165361, 36.85909],
      [10.165276, 36.859118],
      [10.165032, 36.85919],
      [10.164645, 36.859379],
      [10.1638, 36.859771],
      [10.163067, 36.860058],
      [10.163049, 36.860095],
      [10.163226, 36.860338],
      [10.163322, 36.86047],
      [10.163917, 36.861288],
      [10.165443, 36.862623],
      [10.1674, 36.864325],
      [10.167313, 36.864385],
      [10.166862, 36.864669],
      [10.166071, 36.865167],
      [10.165564, 36.86555],
      [10.165294, 36.865755],
      [10.165077, 36.865956],
      [10.164655, 36.866416],
      [10.164768, 36.866456],
    ];

    // Convert to LatLng list (flip [lon, lat] to LatLng(lat, lon))
    final List<LatLng> polylineCoordinates = coordinates
        .map((coord) => LatLng(coord[1], coord[0]))
        .toList();

    final polylineId = PolylineId("route_polyline");
    final polyline = Polyline(
      polylineId: polylineId,
      color: Colors.blue,
      width: 5,
      points: polylineCoordinates,
    );

    polylines[polylineId] = polyline;
    update(); // notify GetBuilder to rebuild with new polylines
  }
}
