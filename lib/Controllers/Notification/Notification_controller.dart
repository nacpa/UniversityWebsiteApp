import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/toast.dart';

class Notification_controller extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  TextEditingController controller_title=TextEditingController();
  TextEditingController controller_body=TextEditingController();

  var isLoading=false.obs;

  final AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("logo");

  void initialize() async {
    InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(
      {int id = 0, String? tittle, String? body, String? payload}) async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("hello",  "help",
            importance: Importance.high, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    initialize();
    await flutterLocalNotificationsPlugin
        .show(id, tittle, body, notificationDetails, payload: payload);
  }

  void show_Scheduled_Notification(
      {int id = 0, String? tittle, String? body, String? payload}) async {
    initialize();
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails("hello", "help",
            importance: Importance.high, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      tittle,
      body,
      RepeatInterval.daily,
      notificationDetails,
      payload: payload,
    );
  }

  void show_Scheduled_Notification_hourley(
      {int id = 0, String? tittle, String? body, String? payload}) async {
    initialize();
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("hello", "help",
            importance: Importance.high, priority: Priority.high);
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      tittle,
      body,
      RepeatInterval.hourly,
      notificationDetails,
      payload: payload,
    );
  }



  Future<void> pushNotification(String title,String body)async {
    isLoading.value=true;

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=AAAAnyS_shE:APA91bEmu_qd5WlSG9jlt9wR0wjMD3uOXUoS61fa_Oz0NaDzLim8c4sOJZOX68MvUtwER7IyHKiopRAxFxSmhYl38tlrcAJHlXuQL5OzuePLMAkYQmJMY40XXXs6ZmijgwnOt3U-cgK0'
    };
    var request = http.Request('POST', Uri.parse('https://fcm.googleapis.com/fcm/send'));
    request.body = json.encode({
      "to": "/topics/GKV",
      "notification": {
        "body": body,
        "title": title
      },
      "data": {
        "routeld": 6
      }
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      toast("Notifications Sent");
      controller_body.clear();
      controller_title.clear();
      Get.back();
    }
    else {
      print(response.reasonPhrase);
      isLoading.value=false;
    }

    isLoading.value=false;



  }
}
