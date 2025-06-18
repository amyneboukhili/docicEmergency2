import 'package:docicemergency2/src/Utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Notifications extends StatefulWidget {
  Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List notifications = [
    {
      "title": "New Emergency",
      "subtitle": "New emergency was triggered",
      "is_read": false,
      "time_since": "2 hours ago",
    },
    {
      "title": "Location reached",
      "subtitle": "You have reached the location",
      "is_read": false,
      "time_since": "23 hours ago",
    },
    {
      "title": "Location reached",
      "subtitle": "You have reached the location",
      "is_read": true,
      "time_since": "1 day ago",
    },
    {
      "title": "New driver",
      "subtitle": "New driver was assigned to the ambulance",
      "is_read": true,
      "time_since": "2 days ago",
    },
    {
      "title": "Location reached",
      "subtitle": "You have reached the location",
      "is_read": true,
      "time_since": "24 days ago",
    },
    // {
    //   "title": "Location reached",
    //   "subtitle": "You have reached the location",
    //   "is_read": true,
    //   "time_since": "1 monht ago",
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Slidable(
                                endActionPane:
                        ActionPane(motion:DrawerMotion(), children: [
                      SlidableAction(
                        // An action can be bigger than the others.------------------------------------------------------------------------
                        flex: 1,
                        onPressed: (context) {
                        notifications.removeAt(index);
                        setState(() {
                          notifications;
                        });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'delete',
                        autoClose: true,
                        borderRadius: BorderRadius.circular(10.r),
                      ),

                    ]),
            child: ListTile(
              selected: !notifications[index]["is_read"],
              title: Text(
                notifications[index]["title"],
                style: TextStyle(
                  color: notifications[index]["is_read"]
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                notifications[index]["subtitle"],
                style: TextStyle(
                  color: notifications[index]["is_read"]
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              leading: Icon(
                notifications[index]["is_read"]
                    ? Icons.notifications_none
                    : Icons.notifications_active,
                color: notifications[index]["is_read"]
                    ? Colors.black
                    : Colors.white,
              ),
              trailing: Text(
                notifications[index]["time_since"],
                style: TextStyle(
                  color: notifications[index]["is_read"]
                      ? Colors.black
                      : Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              selectedTileColor: ThemeUtils.secondaryGreenBlue,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 6.h);
        },
        itemCount: notifications.length,
      ),
    );
  }
}
