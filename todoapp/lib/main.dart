import 'dart:convert';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/common.dart';
import 'package:todoapp/common/navigation.dart';
import 'package:todoapp/data/model/todo.dart';
import 'package:todoapp/data/preferences/preferences_helper.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/provider/dbprovider.dart';
import 'package:todoapp/provider/localizationsprovider.dart';
import 'package:todoapp/provider/preferencesprovider.dart';
import 'package:todoapp/provider/schedulingprovider.dart';
import 'package:todoapp/ui/donetodopage.dart';
import 'package:todoapp/ui/loginpage.dart';
import 'package:todoapp/ui/registerpage.dart';
import 'package:todoapp/ui/settingpage.dart';
import 'package:todoapp/ui/todoadd_updatepage.dart';
import 'package:todoapp/ui/todolistpage.dart';
import 'package:todoapp/utils/backgroundservice.dart';
import 'package:todoapp/utils/notificationhelper.dart';
import 'package:http/http.dart' as http;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'todo-585',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final NotificationHelper _notificationHelper = NotificationHelper();
  final BackgroundService _backgroundService = BackgroundService();
  _backgroundService.initializeIsolate();
  await AndroidAlarmManager.initialize();
  await _notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationHelper _notificationHelper = NotificationHelper();
  final CLOUD_FUNCTION_URL = "https://us-central1-todo-585.cloudfunctions.net";
  Future<void> getFCMToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    final client = http.Client();
    final response = await client.get(
      Uri.parse("$CLOUD_FUNCTION_URL/saveFCMToken?fcm=$token")
    );
    final output = jsonDecode(response.body);
    print(">>> response saveFCMToken: " + output);
    print(">>> FCM Token: $token");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return ChangeNotifierProvider(
    //  create: (context) => DbProvider(),
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DbProvider()),
        ChangeNotifierProvider<PreferencesProvider>(
          create: (context) => PreferencesProvider(preferencesHelper: PreferencesHelper(sharedPreferences: SharedPreferences.getInstance())),
        ),
        ChangeNotifierProvider(
          create: ((context) => SchedulingProvider()),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalizationsProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final provider = Provider.of<LocalizationsProvider>(context);

          return MaterialApp(
            locale: provider.locale,

            // title: 'To Do App',
            title: AppLocalizations.of(context)?.titleAppBar ?? 'titleAppBar NULL',

            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: navigatorKey,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // home: const ToDoListPage(),
            home: Scaffold(
              body: Center(
                // child: const ToDoListPage(),
                child: LoginPage(),
              ),
              bottomNavigationBar: Builder(builder: (context) {
                return BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                    BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Done'),
                    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                  ],
                  currentIndex: 0,
                  onTap: (index) async {
                    switch (index) {
                      case 0:
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return ToDoListPage();
                        }));
                        break;
                      case 1:
                        // tombol done

                        // coba notif
                        // final NotificationHelper notificationHelper = NotificationHelper();
                        // await notificationHelper.showNotification(flutterLocalNotificationsPlugin, Todo(id: 7, title: "Tugas no 7", detail: "Ini tugas belajar fullter"));

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DoneTodoPage();
                        }));

                        break;
                      case 2:
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          print("====== new SettingPage() ");
                          return SettingPage();
                        }));
                        break;
                    }
                  },
                );
              }),
            ),
          );
        }
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _notificationHelper.configureSelectNotificationSubject(ToDoAddUpdatePage.routeName);
    getFCMToken();
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }

  void showFlutterNotification(RemoteMessage message) {
    String temp = message.notification?.title ?? "";
    print(">>> Title => " + temp);
    temp = message.notification?.body ?? "";
    debugPrint(">>> Message => $temp");
  }
}

Future<void> getFCMToken() async {
  final token = await FirebaseMessaging.instance.getToken();
  print(">>> FCM token: " + token.toString());
}