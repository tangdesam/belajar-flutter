import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationHelper {
  static NotificationHelper? _instance;

  NotificationHelper._internal() {
    // TODO internal ini apa ya?
    _instance = this;
  }

  factory NotificationHelper() => _instance ?? NotificationHelper._internal();

  Future<void> initNotifications(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    // app_icon = android/app/src/main/res/drwable/app_icon.png ??
    var initializeSettings = const AndroidInitializationSettings('app_icon');
    await flutterLocalNotificationsPlugin.initialize(InitializationSettings(android: initializeSettings),
        onDidReceiveNotificationResponse: (NotificationResponse details) async {
          final payload = details.payload;
          if (payload != null) {
            print("=== notification payload: " + payload);
          }
          selectNotificationSubject.add(payload ?? 'empty payload (payload kosong)')
        }
    );
  }


}
