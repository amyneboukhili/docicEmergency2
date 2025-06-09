import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoReportsWidget extends StatelessWidget {
  const NoReportsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                          "For now you have no emergency",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            
                          ),
                          textAlign: TextAlign.center,
                        ),
          ),
            SizedBox(height: 20.h,),
         Image(image: AssetImage("assets/images/no_data.png")),
        ],
      ),
    );
  }
}