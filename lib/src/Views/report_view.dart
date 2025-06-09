import 'package:docicemergency2/src/widgets/heart_rate_widget.dart';
import 'package:docicemergency2/src/widgets/no_reports_widget.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    // return NoReportsWidget();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeartRateWidget(),
        
        ],
        ),
      ),
    );
  }
}