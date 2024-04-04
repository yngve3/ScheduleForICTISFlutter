import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:schedule_for_ictis_flutter/app_config.dart';
import 'package:schedule_for_ictis_flutter/domain/models/schedule_subject/schedule_subject.dart';
import 'package:schedule_for_ictis_flutter/main.dart';

import '../../objectbox.g.dart';

class SearchRequestFailureException implements Exception {}

class FavoriteSchedulesRepository {

  late final Box<ScheduleSubject> _favoriteSchedulesBox;

  FavoriteSchedulesRepository() {
    _favoriteSchedulesBox = objectBox.store.box<ScheduleSubject>();
  }

  // api запрос [baseURL/?query=:query] может вернуть четыре варианта json:
  // {"status": "error", "message": "no args provided"}
  // - когда передается пустая строка
  // {"result": "no_entries"}
  // - когда ничего не найдено
  // {"table": {"name": "КТбо4-10", "group": "135.html", ...}
  // - когда результат поиска один элемент, возвращается его расписание.
  // {"choices": [{"name": "КТбо4-1", "group": "126.html", ...}, ...]}
  // - когда результатов несколько.
  // Во всех случаях статус код = 200
  Future<List<ScheduleSubject>> netSearch(String query) async {
    final response =  await http.get(Uri.parse('${AppConfig.baseURL}/?query=$query'));

    final Map<String, dynamic> json = jsonDecode(response.body);

    return switch(json) {
      {"status": String _} => _handleRequestError(),
      {"result": String _} => _handleEmptySearch(),
      {"table": Object _} => _handleOneResultSearch(json),
      {"choices": List _} => _handleManyResultsSearch(json),
      _ => throw SearchRequestFailureException()
    };
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

  Future<ScheduleSubject?> getSelectedFavoriteSchedules(bool isVPK) =>
      _favoriteSchedulesBox
          .query(ScheduleSubject_.isChosen.equals(true).and(ScheduleSubject_.isVPK.equals(isVPK)))
          .build()
          .findFirstAsync();


  Future<List<ScheduleSubject>> _handleRequestError() async {
    return const [];
  }

  Future<List<ScheduleSubject>> _handleEmptySearch() async {
    return const [];
  }

  Future<List<ScheduleSubject>> _handleOneResultSearch(Map<String, dynamic> json) async {
    return [ScheduleSubject.fromJson(json["table"])];
  }

  Future<List<ScheduleSubject>> _handleManyResultsSearch(Map<String, dynamic> json) async {
    List<dynamic> searchResults = json["choices"];
    return searchResults.map((e) => ScheduleSubject.fromJson(e)).toList();
  }
}