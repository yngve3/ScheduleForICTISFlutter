import 'package:objectbox/objectbox.dart';

@Entity()
class CurrentWeek {
  @Id(assignable: true)
  int weekNum;
  int studyWeekNum;

  CurrentWeek({
    required this.weekNum,
    required this.studyWeekNum
  });

  int get offset => weekNum - studyWeekNum;
}