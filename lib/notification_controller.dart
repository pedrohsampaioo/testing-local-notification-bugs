import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    print('** onNotificationCreatedMethod **');
    print(receivedNotification);
  }

  /// Use this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    print('** onNotificationDisplayedMethod **');
    print(receivedNotification);
  }

  /// Use this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    print('** onDismissActionReceivedMethod **');
    print(receivedAction);
  }

  /// Use this method to detect when the user taps on a notification or action button
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    print('** onActionReceivedMethod **');
    print(receivedAction);
  }
}
