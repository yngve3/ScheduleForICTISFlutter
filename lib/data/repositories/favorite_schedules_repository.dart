import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedule_for_ictis_flutter/app_config.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

import '../../objectbox.g.dart';

class SearchResultEmptyException implements Exception {}
class SearchRequestFailure implements Exception {}

class FavoriteSchedulesRepository {

  late final Box<ScheduleSubject> _favoriteSchedulesBox;

  FavoriteSchedulesRepository() {
    _favoriteSchedulesBox = objectBox.store.box<ScheduleSubject>();
  }

  // api запрос [baseURL/?query=:query] может вернуть три варианта json:
  // {"status": "error", "message": "no args provided"}
  // - когда передается пустая строка
  // {"table": {"name": "КТбо4-10", "group": "135.html", ...}
  // - когда результат поиска один элемент, возвращается его расписание.
  // {"choices": [{"name": "КТбо4-1", "group": "126.html", ...}, ...]}
  // - когда результатов несколько.
  // Во всех случаях статус код = 200
  Future<List<ScheduleSubject>> netSearch(String query) async {
    final response =  await http.get(Uri.parse('${AppConfig.baseURL}/?query=$query'));

    final Map<String, dynamic> json = jsonDecode(response.body);

    if (json.containsKey("status")) return const [];
    if (json.containsKey("result")) return const [];

    if (json.containsKey("table")) {
      return [ScheduleSubject.fromJson(json["table"])];
    }

    if (json.containsKey("choices")) {
      List<dynamic> searchResults = json["choices"];
      return searchResults.map((e) => ScheduleSubject.fromJson(e)).toList();
    }

    throw SearchRequestFailure();
  }

  Stream<List<ScheduleSubject>> getFromDBAll() {
    QueryBuilder<ScheduleSubject> query = _favoriteSchedulesBox.query();
    return query.watch(triggerImmediately: true).map((query) => query.find());
  }

  void saveToDB(ScheduleSubject scheduleSubject) {
    _favoriteSchedulesBox.putAsync(scheduleSubject);
  }

  void saveToDBMany(List<ScheduleSubject> scheduleSubjects) {
    _favoriteSchedulesBox.putManyAsync(scheduleSubjects);
  }

  void deleteFromDBMany(List<int> ids) {
    _favoriteSchedulesBox.removeManyAsync(ids);
  }

  // Stream<ScheduleSubject?> getSelectedFavoriteSchedule() {
  //   QueryBuilder<ScheduleSubject> query = _favoriteSchedulesBox.query(
  //       ScheduleSubject_.isChosen.equals(true)
  //   );
  //
  //   return query.watch(triggerImmediately: true).map((query) => query.findFirst());
  // }

  ScheduleSubject? getSelectedFavoriteSchedule() {
    QueryBuilder<ScheduleSubject> query = _favoriteSchedulesBox.query(
        ScheduleSubject_.isChosen.equals(true)
    );
    return query.build().findFirst();
  }
}