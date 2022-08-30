import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'package:testing_local_notifications/notification_config_env.dart';
import 'package:testing_local_notifications/notification_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(
    'resource://drawable/res_app_icon',
    [
      NotificationChannel(
        channelGroupKey: NotificationConfigEnv.channelGroupKey,
        channelKey: NotificationConfigEnv.channelKey,
        channelName: NotificationConfigEnv.channelName,
        channelDescription: NotificationConfigEnv.channelDescription,
        defaultColor: Colors.red,
        ledColor: Colors.white,
      )
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: NotificationConfigEnv.channelGroupKey,
        channelGroupName: NotificationConfigEnv.channelGroupName,
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Local Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Testing Local Notifications'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () async => createNotification(),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Create Schedule Notification',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> createNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: UniqueKey().hashCode,
        channelKey: NotificationConfigEnv.channelKey,
        title: 'Simple scheduled notification',
        body: 'Simple scheduled body of notification',
        actionType: ActionType.Default,
        displayOnForeground: false,
        payload: {"info": "info"},
      ),
      schedule: NotificationCalendar.fromDate(
        preciseAlarm: true,
        date: DateTime.now().add(const Duration(seconds: 15)),
      ),
    );
  }
}
