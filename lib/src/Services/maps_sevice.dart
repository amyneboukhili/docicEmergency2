import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsService {
  // final String _apiKey = "AIzaSyB_LyKwGCVZPgJCRkqQIpZKBOESshYsIp4";

  Future<List<LatLng>> getRouteCoordinates(LatLng origin, LatLng destination) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=nokey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['routes'].isNotEmpty) {
        print("Directions response: ${response.body}");
        final points = jsonData['routes'][0]['overview_polyline']['points'];
        final List<PointLatLng> result = PolylinePoints().decodePolyline(points);
        return result.map((p) => LatLng(p.latitude, p.longitude)).toList();
      } else {
        throw Exception("No route found.");
      }
    } else {
      throw Exception("Failed to fetch directions: ${response.body}");
    }
  }
}
