import 'package:docicemergency2/src/Controllers/home_controller.dart';
import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:docicemergency2/src/Views/map_view.dart';
import 'package:docicemergency2/src/Views/notifications.dart';
import 'package:docicemergency2/src/Views/profile_view.dart';
import 'package:docicemergency2/src/Views/report_view.dart';
import 'package:docicemergency2/src/Views/speech_to_text._view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Widget> screens = [
    MapView(),
    ReportView(),
    Notifications(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.indexTab,
            children: screens,
            alignment: Alignment.center,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: controller.indexTab == 1
            ? CustomFloatingActionButton(
                icon: Icon(Icons.mic),
                text: "Speech To Text",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SpeechToTextView(),
                    ),
                  );
                },
              )
            : controller.indexTab == 3
            ? CustomFloatingActionButton(
                icon: Icon(Icons.logout),
                text: "Logout",
                onPressed: () {},
              )
            : null,
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: ThemeUtils.fillColorLight,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(4, (i) {
              final isSelected = controller.indexTab == i;

              return GestureDetector(
                onTap: () => controller.changeTab(i),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage(controller.icons[i]),
                      color: isSelected
                          ? ThemeUtils.secondaryGreenBlue
                          : Colors.black,
                    ),
                    Text(
                      controller.labels[i],
                      style: TextStyle(
                        color: isSelected
                            ? ThemeUtils.secondaryGreenBlue
                            : Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget CustomFloatingActionButton({
    required String text,
    required Icon icon,
    required Function() onPressed,
  }) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 80.w),
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(text),
        icon: icon,
        style: TextButton.styleFrom(backgroundColor: Colors.red),
      ),
    );
  }
}
