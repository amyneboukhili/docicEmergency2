import 'package:docicemergency2/src/Controllers/home_controller.dart';
import 'package:docicemergency2/src/Controllers/map_controller.dart';
import 'package:docicemergency2/src/Controllers/reports_controller.dart';
import 'package:get/get.dart';

class HomeBidings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(MapController());
    Get.put(ReportsController());

  }
}