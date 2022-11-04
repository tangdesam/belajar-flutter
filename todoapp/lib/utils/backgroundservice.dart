import 'dart:isolate';
import 'dart:ui';

import 'package:todoapp/main.dart';
import 'package:todoapp/utils/notificationhelper.dart';
import 'package:todoapp/provider/dbprovider.dart';

final ReceivePort port = ReceivePort();

class BackgroundService {
  static BackgroundService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  BackgroundService._internal() {
    _instance = this;
  }

  factory BackgroundService() => _instance ?? BackgroundService._internal();

  void initializeIsolate() {
    // booking port untuk komunikasi service nya
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callbak() async {
    print('=== Alarm aktif');
    final NotificationHelper notificationHelper = NotificationHelper();
    final db = DbProvider();
    final todo = await db.getOldestTodo();
    print(todo);
    await notificationHelper.showNotification(flutterLocalNotificationsPlugin, todo);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}