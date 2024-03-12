abstract class Routes {
  static Route schedule = const Route("/schedule");
  static Route preferences = const Route("/preferences");
  static Route favoriteSchedules = const Route("/preferences/favorite_schedules");
  static Route addFavoriteSchedule = const Route("/preferences/favorite_schedules/add");
}

class Route {
  const Route(this.path);
  final String path;

  String get lastPathComponent => path.split("/").last;
}