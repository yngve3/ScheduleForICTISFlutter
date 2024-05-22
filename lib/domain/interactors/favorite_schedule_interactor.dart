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
    final vpkIsNotEmpty = _favoriteSchedulesRepository.isNotEmpty(_userRepository.uid ?? "", true);
    final mainIsNotEmpty = _favoriteSchedulesRepository.isNotEmpty(_userRepository.uid ?? "", false);
    bool isChosen = false;

    if (!vpkIsNotEmpty && scheduleSubject.isVPK) isChosen = true;
    if (!mainIsNotEmpty && scheduleSubject.isNotVPK) isChosen = true;
    _favoriteSchedulesRepository.saveToDB(scheduleSubject.copyWith(userUID: _userRepository.uid, isChosen: isChosen));
  }

  void saveToDBMany(List<ScheduleSubject> scheduleSubjects) {
    _favoriteSchedulesRepository.saveToDBMany(scheduleSubjects);
  }

  void deleteFromDBMany(List<int> ids) {
    _favoriteSchedulesRepository.deleteFromDBMany(ids);
  }
}