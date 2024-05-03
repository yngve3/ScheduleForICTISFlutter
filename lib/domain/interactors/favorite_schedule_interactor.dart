import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/user_repository.dart';

import '../models/schedule_subject/schedule_subject.dart';

class FavoriteSchedulesInteractor {
  final FavoriteSchedulesRepository _favoriteSchedulesRepository = FavoriteSchedulesRepository();
  final UserRepository _userRepository = UserRepository();

  Future<List<ScheduleSubject>> netSearch(String query) {
    return _favoriteSchedulesRepository.netSearch(query);
  }

  Stream<List<ScheduleSubject>> getFromDBAll() {
    return _favoriteSchedulesRepository.getFromDBAll(userUID: _userRepository.uid);
  }

  void saveToDB(ScheduleSubject scheduleSubject) {
    _favoriteSchedulesRepository.saveToDB(scheduleSubject.copyWith(userUID: _userRepository.uid));
  }

  void saveToDBMany(List<ScheduleSubject> scheduleSubjects) {
    _favoriteSchedulesRepository.saveToDBMany(scheduleSubjects);
  }

  void deleteFromDBMany(List<int> ids) {
    _favoriteSchedulesRepository.deleteFromDBMany(ids);
  }
}