import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../domain/models/notification/reminder.dart';

class RemindersHelper {
  static const channelKey = "basic_channel";

  static void init() async {
    await AwesomeNotifications().initialize(
      null,
      [NotificationChannel(
        channelKey: channelKey,
        channelName: "Reminders",
        channelDescription: "Channel for reminders"
      )],
    );
    checkNotificationPermissions();
  }

  static void createNotification(Reminder notification) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(0x7fffffffffffffff),
        channelKey: channelKey,
        actionType: ActionType.Default,
        title: notification.title,
        body: notification.body,
        wakeUpScreen: false,
        category: NotificationCategory.Reminder,
        criticalAlert: true
      ),
      schedule: NotificationCalendar(
        year: notification.dateTime.year,
        month: notification.dateTime.month,
        day: notification.dateTime.day,
        hour: notification.dateTime.hour,
        minute: notification.dateTime.minute,
        second: notification.dateTime.second,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        preciseAlarm: true,
        allowWhileIdle: true
      )
    );
  }

  static void checkNotificationPermissions() async {
    final isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }
}