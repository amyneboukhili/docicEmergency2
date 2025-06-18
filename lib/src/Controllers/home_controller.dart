import 'package:docicemergency2/src/Services/web_socket_service.dart';
import 'package:docicemergency2/src/widgets/emergency_dialog.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int indexTab = 0;

  final List<String> icons = [
    "assets/icons/HomeIcon.png",
    "assets/icons/Emergencyicon.png",
    "assets/icons/NotifcationIcon.png",
    "assets/icons/ProfileIcon.png",
  ];

  final List<String> labels = [
    'Home',
    'Report',
    'notification',
    'Profile',
  ];

    @override
  void onInit() {
    super.onInit();
    
  }

  @override
  void onClose() {
    super.onClose();
  }
  void changeTab(int index){
    
    indexTab = index;
    update();

  }
  
}