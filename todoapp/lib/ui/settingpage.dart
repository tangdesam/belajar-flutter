import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/preferencesprovider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
        builder: (context, provider, child) {
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
                      value: provider.isNotifEnabled,
                      onChanged: (value) {
                        provider.enableNotif(value);
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
