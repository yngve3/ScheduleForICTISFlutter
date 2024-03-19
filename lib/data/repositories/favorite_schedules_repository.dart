import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedule_for_ictis_flutter/app_config.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

class SearchResultEmptyException implements Exception {}
class SearchRequestFailure implements Exception {}

class FavoriteSchedulesRepository {

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
    return objectBox.getFavoriteSchedules();
  }

  void saveToDB(ScheduleSubject scheduleSubject) {
    objectBox.addFavoriteSchedule(scheduleSubject);
  }

  void saveToDBMany(List<ScheduleSubject> scheduleSubjects) {
    objectBox.addFavoriteSchedules(scheduleSubjects);
  }

  void deleteFromDBMany(List<int> ids) {
    objectBox.deleteFavoriteSchedules(ids);
  }
}