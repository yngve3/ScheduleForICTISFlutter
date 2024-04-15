import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

import '../domain/models/reminder/reminder.dart';

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

  static void createReminder(Reminder reminder) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(0x7fffffffffffffff),
        channelKey: channelKey,
        actionType: ActionType.Default,
        title: reminder.title,
        body: reminder.body,
        wakeUpScreen: false,
        category: NotificationCategory.Reminder,
        criticalAlert: true
      ),
      schedule: NotificationCalendar(
        year: reminder.dateTime?.year,
        month: reminder.dateTime?.month,
        day: reminder.dateTime?.day,
        hour: reminder.dateTime?.hour,
        minute: reminder.dateTime?.minute,
        second: reminder.dateTime?.second,
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