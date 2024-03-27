import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/favorite_schedules_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_list/cubit/favorite_schedules_list_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/favorite_schedules/pages/favorite_schedules_list/cubit/favorite_schedules_list_state.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/icons.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';

import '../../../../../domain/models/schedule_subject/schedule_subject.dart';
import '../../../../route/routes.dart';
import '../../../../widgets/schedule_subject_widget.dart';

class FavoriteSchedulesListPage extends StatelessWidget {
  const FavoriteSchedulesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        title: "Расписания",
        actions: [
          IconButton(
              onPressed: () =>
                context.go(Routes.addFavoriteSchedule.path),
              icon: CustomIcons.add.image()
          )
        ],
      ),
      body: BlocProvider (
        create: (context) => FavoriteSchedulesListCubit(FavoriteSchedulesRepository())..getFavoriteSchedules(),
        child: BlocBuilder<FavoriteSchedulesListCubit, FavoriteSchedulesListState>(
          builder: (context, state) =>
              Padding(
                  padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
                  child: Column(
                    children: [
                      FavoriteSchedulesList(favoriteSchedules: state.favoriteSchedules),
                      const SizedBox(height: 15),
                      FilledButton(
                        onPressed: () {
                          context.read<FavoriteSchedulesListCubit>().saveChanges();
                          context.pop();
                        },
                        child: const Text("Готово"),
                      )
                    ],
                  )
              ),
        )
      )
    );
  }
}

class FavoriteSchedulesList extends StatelessWidget {
  const FavoriteSchedulesList({
    super.key,
    required this.favoriteSchedules
  });

  final List<ScheduleSubject> favoriteSchedules;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
          children: favoriteSchedules.map((element) =>
              Dismissible(
                  key: Key(element.dbId.toString()),
                  onDismissed: (DismissDirection direction) {
                    context.read<FavoriteSchedulesListCubit>().delete(element);
                  },
                  child: ScheduleSubjectWidget(
                      scheduleSubject: element,
                      callback: (scheduleSubject) {
                        context.read<FavoriteSchedulesListCubit>().select(scheduleSubject);
                      }
                  )
              )
          ).toList(),
        )
    );
  }
}