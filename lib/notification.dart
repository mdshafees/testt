// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPush {
  setUpFireBaseMessage(BuildContext context) async {
    FirebaseMessaging.instance.getToken().then((deviceToken) async {
      print("Device_Token:::::::::$deviceToken");
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeMessage = message.data["type"];
        print("Get initial Message from firebase");
        print(routeMessage);
      }
    });

    /// THIS METHOD GETS CALLED WHEN APP IS IN FOREGROUND
    ///
    // FirebaseMessaging.onMessage.listen((message) {
    //   if (message.notification != null) {
    //     print("On_Foreground_Called");
    //     print(message.notification!.title);
    //     print(message.notification!.body);
    //     LocalNotificationPush.displayMessage(message);
    //   }
    // });

    /// THIS METHOD GETS CALLED WHEN THE APP IS IN BACKGROUND
    /// AND NOT TERMINATE OR KILL THE APP AND USER TOUCH ON NOTIFICATION

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      var payLoad = message.data;
      //  if (payLoad["type"] == "new_order") {
      print(jsonEncode(payLoad));
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return OrderDetailsScreen(message.data["order"]);
      // }));
      // }
    });
  }
}

// class LocalNotificationPush {
//   static FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static void initialize(BuildContext context) {
//     final InitializationSettings initializationSettings =
//         InitializationSettings(android: AndroidInitializationSettings("logo"));
//     _notificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: (message) async {
//       //var pay = jsonDecode(message!);
//       // if (pay["type"] == "new_order") {
//       //   Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //     return OrderDetailsScreen(pay["order"]);
//       //   }));
//       // }
//     });
//   }

//   static void displayMessage(RemoteMessage message) async {
//     try {
//       // ignore: prefer_const_constructors
//       final NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails("Dhwarco", "Dhwarco",
//               priority: Priority.high,
//               importance: Importance.high,
//               playSound: true));

//       await _notificationsPlugin.show(
//         0,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//         payload: jsonEncode(message.data),
//       );
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
// }
