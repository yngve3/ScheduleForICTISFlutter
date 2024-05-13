import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/search_schedule_screen/cubit/search_schedule_state.dart';

class SearchScheduleCubit extends Cubit<SearchScheduleState> {
  SearchScheduleCubit() : super(const SearchScheduleState());
  final _repository = FavoriteSchedulesRepository();

  void changeCategory(SearchCategory category) {
    emit(state.copyWith(category: category));
  }

  void search(String query) async {
    final result = await _repository.netSearch(query);
    emit(state.copyWith(searchResults: result));
  }
}
