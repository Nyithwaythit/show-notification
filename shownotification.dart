import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon'); // Replace 'app_icon' with your app's icon name
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // Replace with your channel ID
      'your_channel_name', // Replace with your channel name
      'your_channel_description', // Replace with your channel description
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      icon: 'app_icon', // Replace 'app_icon' with your app's icon name
    );
    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await NotificationApi.showNotification(    
                title: 'Booking Successful',
                body: 'Your booking has been successfully recorded!',
              );
            },
            child: Text('Show Notification'),
          ),
        ),
      ),
    );
  }
}
dependencies:
  flutter_local_notifications: ^5.0.0
