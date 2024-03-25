import '../../domain/models/schedule/day_schedule_item.dart';
import '../../objectbox.g.dart';

class EventsRepository {
  late final Box<Event> _eventsBox;

  Future<List<Event>> getEvents() {
    return _eventsBox.getAllAsync();
  }

  void addEvent(Event event) {
    _eventsBox.putAsync(event);
  }
}