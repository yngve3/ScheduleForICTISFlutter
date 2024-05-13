import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/search_schedule_screen/cubit/search_schedule_state.dart';

class SearchScheduleCubit extends Cubit<SearchScheduleState> {
  SearchScheduleCubit() : super(const SearchScheduleState());

  void changeCategory(SearchCategory category) {
    emit(state.copyWith(category: category));
  }
}
