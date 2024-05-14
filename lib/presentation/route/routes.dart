abstract class Routes {
  static SimpleRoute login = const SimpleRoute("/login");
  static SimpleRoute registration = const SimpleRoute("/login/registration");

  static SimpleRoute schedule = const SimpleRoute("/schedule");
  static SimpleRoute preferences = const SimpleRoute("/preferences");
  static SimpleRoute home = const SimpleRoute("/home");

  static SimpleRoute searchSchedule = const SimpleRoute("/home/search_schedule");
  static SimpleRoute searchScheduleResult = const SimpleRoute("/home/search_schedule/schedule");
  static SimpleRoute allNotes = const SimpleRoute("/home/all_notes");

  static SimpleRoute favoriteSchedules = const SimpleRoute("/preferences/favorite_schedules");
  static SimpleRoute addFavoriteSchedule = const SimpleRoute("/preferences/favorite_schedules/add");

  static SimpleRoute addEvent = const SimpleRoute("/schedule/events/add");
  static RouteWithParameters eventInfo = RouteWithParameters("/schedule/events/:event_id");

  static RouteWithParameters coupleNotesList = RouteWithParameters("/schedule/couples/:couple_id");
  static RouteWithParameters addNote = RouteWithParameters("/schedule/couples/:couple_id/notes/add");
  static RouteWithParameters noteInfo = RouteWithParameters("/schedule/couples/:couple_id/notes/:note_id");
}

abstract class Route {
  const Route(this._path);
  final String _path;

  String get lastPathComponent => _path.split("/").last;
  String get twoLastPathComponents {
    final splitPath = _path.split("/");
    return "${splitPath[splitPath.length - 2]}/${splitPath.last}";
  }
}

class SimpleRoute extends Route {
  const SimpleRoute(super._path);

  String get path => _path;
}

class RouteWithParameters extends Route{
  RouteWithParameters(super._path);

  String path(Map<String, dynamic> params) {
    String path = _path;
    for (final paramKey in params.keys) {
      path = path.replaceAll(":$paramKey", params[paramKey].toString());
    }

    return path;
  }
}