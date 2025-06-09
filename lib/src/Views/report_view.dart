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
                healthInfoWidget(
                  color: Color(0xFFDFC5CF),
                  icon: Icon(
                    Icons.bloodtype,
                    color: Color(0xFF9C4A6B),
                    size: 40.r,
                  ),
                  title: "Blood Type",
                  value: "A+",
                ),
                healthInfoWidget(
                  color: Color(0xFFFBF0DC),
                  icon: Icon(
                    Icons.monitor_weight,
                    color: Color(0xFFD2B47D),
                    size: 40.r,
                  ),
                  title: "Weight",
                  value: "59KG",
                ),
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
      height: 145.w,
      width: 150.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
