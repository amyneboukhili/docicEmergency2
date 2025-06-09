import 'package:docicemergency2/src/Controllers/reports_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeartRateWidget extends StatelessWidget {
  const HeartRateWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportsController>(
      builder: (controller) => Container(
        width: 325.w,
        height: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(123, 64, 123, 226),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.favorite, color: Colors.black, size: 35),
                const SizedBox(height: 8),
                const Text(
                  '72 bpm',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const Text('Heart rate', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(width: 16.h),
            Expanded(
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: controller.heartRateSpots,
                      isCurved: true,
                      color: Colors.red,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                      barWidth: 3,
                    ),
                  ],
                  minY: 60,
                  maxY: 80,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
