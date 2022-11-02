import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todoapp/common/navigation.dart';
import 'package:todoapp/data/model/todo.dart';

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

  Future<void> showNotification(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin, Todo todo) async {
    // pakai/ada channel karena notif bisa didengar utk aplikasi lain
    var channelId = "1";
    var channelName = "channel_01";
    var channelDescription = "Todo Info Channel";

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(channelId, channelName,
        channelDescription: channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        styleInformation: const DefaultStyleInformation(true, true)
    );

    var titleNotification = "<b> Todo Update </b>";
    var titleTodo = todo.title;

    await flutterLocalNotificationsPlugin.show(0, titleNotification, titleTodo,
        NotificationDetails(
            android: androidPlatformChannelSpecifics),
            payload: jsonEncode(todo.toMap()
        )
    );
  }

  void configureSelectNotificationSubject(String route) {
    selectNotificationSubject.stream.listen((String payload) async {
      var data = Todo.fromMap(json.decode(payload));
      Navigation.intentWithData(route, data);
    });
  }
}
