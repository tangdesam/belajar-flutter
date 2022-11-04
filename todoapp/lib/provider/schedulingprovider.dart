import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/utils/backgroundservice.dart';
import 'package:todoapp/utils/datetimehelper.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isScheduled = false;

  bool get isScheduled => _isScheduled;

  Future<bool> scheduledTodo(bool value) async {
    _isScheduled = value;
    if (_isScheduled) {
      print('Scheduling todo activated');
      notifyListeners();
      return await AndroidAlarmManager.oneShot(
          const Duration(seconds: 5),
          1,
          BackgroundService.callbak,
          exact: true,
          wakeup: true
      );
      // return await AndroidAlarmManager.periodic(
      //   const Duration(hours: 24),
      //   1,
      //   BackgroundService.callbak,
      //   startAt: DateTimeHelper.format(),
      //   exact: true,
      //   wakeup: true
      // );
    }
    else {
      print('Scheduling todo activated');
      notifyListeners();
      return await AndroidAlarmManager.cancel(1);
    }
  }
}