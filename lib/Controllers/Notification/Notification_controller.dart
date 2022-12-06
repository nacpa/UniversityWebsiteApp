import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class Notification_controller extends GetxController {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
        const AndroidNotificationDetails("hello", "help",
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
}
