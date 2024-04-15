import 'package:objectbox/objectbox.dart';

@Entity()
class Reminder {
  @Id(assignable: true) final int id;
  @Property(type: PropertyType.date)
  final DateTime dateTime;
  String? title;
  String? body;
  final int minutesBefore;

  Reminder({
    required this.id,
    required this.dateTime,
    required this.minutesBefore,
    this.title,
    this.body
  });

  void setTitleAndBody({required String title, String? body}) {
    this.title = title;
    this.body = body;
  }

  factory Reminder.beforeDateTime(DateTime dateTime, Duration durationBefore, {
    required int id,
    String? title,
    String? body
  }) {
    final date = dateTime.subtract(durationBefore);
    final minutesBefore = durationBefore.inMinutes;
    return Reminder(
      id: id,
      title: title,
      body: body,
      dateTime: date,
      minutesBefore: minutesBefore
    );
  }
}