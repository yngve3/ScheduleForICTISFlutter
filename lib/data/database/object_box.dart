import 'package:objectbox/objectbox.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import '../../objectbox.g.dart';

class ObjectBox {
  late final Store _store;
  late final Box<ScheduleSubject> _favoriteSchedulesBox;

  ObjectBox._create(this._store) {
    _favoriteSchedulesBox = Box<ScheduleSubject>(_store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-example"));
    return ObjectBox._create(store);
  }

  void addFavoriteSchedule(ScheduleSubject scheduleSubject) =>
      _favoriteSchedulesBox.putAsync(scheduleSubject);

  void addFavoriteSchedules(List<ScheduleSubject> scheduleSubjects) =>
    _favoriteSchedulesBox.putManyAsync(scheduleSubjects);

  void deleteFavoriteSchedules(List<int> ids) {
    _favoriteSchedulesBox.removeManyAsync(ids);
  }

  Stream<List<ScheduleSubject>> getFavoriteSchedules() {
    QueryBuilder<ScheduleSubject> query = _favoriteSchedulesBox.query();
    return query.watch(triggerImmediately: true).map((query) => query.find());
  }
}