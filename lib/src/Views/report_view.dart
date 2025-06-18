import 'package:docicemergency2/src/Controllers/reports_controller.dart';
import 'package:docicemergency2/src/widgets/Floating_action_button.dart';
import 'package:docicemergency2/src/widgets/health_info_widget.dart';
import 'package:docicemergency2/src/widgets/heart_rate_widget.dart';
import 'package:docicemergency2/src/widgets/no_reports_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ReportView extends StatelessWidget {
 const  ReportView({super.key});
  @override
  Widget build(BuildContext context) {
    // return 
    return GetBuilder<ReportsController>(builder: (controller) => (controller.allergies == null || controller.allergies!.isEmpty) ? NoReportsWidget():SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeartRateWidget(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HealthInfoWidget(
                    color: Color(0xFFDFC5CF),
                    icon: Icon(
                      Icons.bloodtype,
                      color: Color(0xFF9C4A6B),
                      size: 40.r,
                    ),
                    title: "Blood Type",
                    value: "${controller.fiche?.bloodType ?? 'nothing'}",
                  ),
                  HealthInfoWidget(
                    color: Color(0xFFFBF0DC),
                    icon: Icon(
                      Icons.monitor_weight,
                      color: Color(0xFFD2B47D),
                      size: 40.r,
                    ),
                    title: "Weight",
                    value: "${controller.fiche?.pois ?? 'nothing'} KG",
                  ),
                  
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   HealthInfoWidget(
                    color: Color(0xFFFBF0DC),
                    icon: Icon(
                      Icons.person_4,
                      color: Color(0xFFD2B47D),
                      size: 40.r,
                    ),
                    title: "Age",
                    value: "${controller.fiche?.age ?? 'nothing'}",
                  ),
                   HealthInfoWidget(
                    color: Color(0xFFFBF0DC),
                    icon: Icon(
                      Icons.height,
                      color: Color(0xFFD2B47D),
                      size: 40.r,
                    ),
                    title: "Hight",
                    value: "${controller.fiche?.taille ?? 'nothing'} CM",
                  ),
                ],
      
              ),
              SizedBox(height: 20.h),
              Text(
                "Reports list",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 4.h),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.allergies![index].typeAllergie),
                    subtitle: Text(
                     controller.allergies![index].allergie.join(', '),
                    ), // Join list into one string
                    leading: Icon(Icons.insert_drive_file),
                    trailing: Text("11/6/2025"),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10.h);
                },
                itemCount: controller.allergies!.length,
              ),
            SizedBox(height: 10.h,),
               CustomFloatingActionButton(
                  icon: Icon(Icons.mic),
                  text: "Speech To Text",
                  onPressed: () {
                    Get.toNamed('speetch_to_text');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SpeechToTextView(),
                    //   ),
                    // );
                  },
                )
            ],
          ),
        ),
      ),
    ));
  }
}
