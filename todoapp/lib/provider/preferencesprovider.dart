import 'package:flutter/cupertino.dart';
import 'package:todoapp/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  bool _isNotifEnabled = false;

  bool get isNotifEnabled => _isNotifEnabled;

  set isNotifEnabled(bool value) {
    _isNotifEnabled = value;
  }

  PreferencesProvider({required this.preferencesHelper}) {
    _getNotifEnabled();
  }

  void _getNotifEnabled() async {
    _isNotifEnabled = await preferencesHelper.isNotifEnabled;
    notifyListeners();
  }

  void enableNotif(bool value) {
    preferencesHelper.setNotifEnabled(value);
    _getNotifEnabled();
  }
}