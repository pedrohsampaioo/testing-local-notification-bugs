abstract class NotificationConfigEnv {
  static String get channelGroupKey => 'basic_channel_group';
  static String get channelKey => 'basic_channel';
  static String get channelName => 'Basic notifications';
  static String get channelDescription =>
      'Notification channel for basic tests';
  static String get channelGroupName => 'Basic group';

  static String get ignoreChannelGroupKey => 'ignore_channel_group';
  static String get ignoreChannelKey => 'ignore_channel';
  static String get ignoreChannelName => 'Ignore Basic notifications';
  static String get ignoreChannelDescription =>
      'Ignore Notification channel for basic tests';
  static String get ignoreChannelGroupName => 'Ignore Basic group';
}
