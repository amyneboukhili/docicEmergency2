// ignore_for_file: file_names

import 'package:docicemergency2/src/Models/ambulance_model.dart';
import 'package:docicemergency2/src/Services/auth_service.dart';
import 'package:docicemergency2/src/widgets/mySnackBar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
   final TextEditingController serialController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();
    final TextEditingController driverNameController = TextEditingController();
    RxInt staffNumber = 1.obs;
     RxBool  ispassword = false.obs;
    AuthService ath =AuthService();
    @override
  void onInit() {
    super.onInit();
  }

  void addstaf(){
   staffNumber.value += 1;
    update();
  }
  void minusStuf(){
     if (staffNumber.value > 1) {
      staffNumber.value -= 1;
       update();
    }
  }

Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
    
      throw Exception('Location permissions are permanently denied.');
    } 
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }



  Future<void> signup() async{
   
    try {
       final Position mylocation = await determinePosition();
      AmbulanceModel user = AmbulanceModel(serieNumber: serialController.text, password: passwordController.text, driverName: driverNameController.text, stafNumber: staffNumber.value.toString(),locationLat: mylocation.latitude.toString(),locationLng:mylocation.longitude.toString() );
      bool result= await ath.singup(user);
      if (result) {
        mySnackBar.show(
          message: "seccess: signup ", title: "sucsess", isSuccess: true);
          Get.toNamed('login');
      } else {
        mySnackBar.show(
          message: "error signup", title: "Error", isSuccess: false);
      }
    } catch (e) {
      mySnackBar.show(
          message: "Unexpected error: $e", title: "Error", isSuccess: false);
    }
  } 

}