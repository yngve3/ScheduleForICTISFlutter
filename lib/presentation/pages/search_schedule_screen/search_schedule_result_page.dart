import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor_search_page.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/cubit/schedule_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/schedule_page.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';

import '../../../domain/models/schedule_subject/schedule_subject.dart';
import '../schedule/cubit/schedule_state.dart';

class SearchScheduleResultPage extends StatelessWidget {
  const SearchScheduleResultPage({
    super.key,
    required this.scheduleSubject
  });

  final ScheduleSubject scheduleSubject;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScheduleCubit(ScheduleInteractorSearchPage(scheduleSubject))..changeWeek(),
      child: BlocBuilder<ScheduleCubit, ScheduleState>(
        builder: (context, state) {
          return Scaffold(
            appBar: MyAppBar(
              appBar: AppBar(),
              title: scheduleSubject.name
            ),
            body: const Schedule(),
          );
        }
      ),
    );
  }
}
