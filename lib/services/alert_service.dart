import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlertService {
  final _notifications = FlutterLocalNotificationsPlugin();

  Future<void> showNotification(String title, String message) async {
    const androidDetails = AndroidNotificationDetails('id', 'CyberSecurityApp',
        importance: Importance.max);
    const generalDetails = NotificationDetails(android: androidDetails);
    await _notifications.show(0, title, message, generalDetails);
  }
}
