import 'package:docicemergency2/src/widgets/heart_rate_widget.dart';
import 'package:docicemergency2/src/widgets/no_reports_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    // return NoReportsWidget();
    return Padding(
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
                healthInfoWidget(color: Color(0xFFDFC5CF), icon: Icon(Icons.pin_drop), title: "Blood Type", value: "A+"),
                healthInfoWidget(color: Color(0xFFFBF0DC), icon: Icon(Icons.line_weight), title: "Weight", value: "59KG"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget healthInfoWidget({
    required Color color,
    required String title,
    required String value,
    required Icon icon,
  }) {
    return Container(
      height: 150.w,
      width: 150.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [icon, Text(title), Text(value)]),
    );
  }
}
