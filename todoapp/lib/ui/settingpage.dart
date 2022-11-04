import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/preferencesprovider.dart';
import 'package:todoapp/provider/schedulingprovider.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting';
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<PreferencesProvider, SchedulingProvider>(
        builder: (context, preferencesProvider, schedulingProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Setting'),
            ),
            body: ListView(
              children: [
                Material(
                  child: ListTile(
                    title: const Text('Enable Notifications'),
                    trailing: Switch.adaptive(
                      value: preferencesProvider.isNotifEnabled,
                      onChanged: (value) {
                        preferencesProvider.enableNotif(value);
                        schedulingProvider.scheduledTodo(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
