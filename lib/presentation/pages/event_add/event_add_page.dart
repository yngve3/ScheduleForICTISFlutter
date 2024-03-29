import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/event_add/cubit/event_add_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/event_add/cubit/event_add_state.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';

import '../../../gen/assets.gen.dart';
import '../../widgets/property/properties/date_property.dart';
import '../../widgets/property/properties/input_property.dart';
import '../../widgets/property/properties/time_property.dart';

class EventAddPage extends StatelessWidget {
  const EventAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBar: AppBar(), title: "Мероприятие"),
      body: BlocProvider(
          create: (context) => EventAddCubit(), child: const EventAdd()),
    );
  }
}

class EventAdd extends StatelessWidget {
  const EventAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<EventAddCubit>(context);
    return BlocBuilder<EventAddCubit, EventAddState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Expanded(
            child: Column(
              children: [
                InputProperty(
                    hint: "Название",
                    onChanged: (value) => cubit.titleChanged(value)),
                InputProperty(
                    hint: "Описание",
                    isMultiLines: true,
                    icon: Assets.icons.icList.image(color: context.customColors.text1),
                    onChanged: (value) => cubit.descriptionChanged(value)),
                TimeProperty(
                  timeStart: state.timeStart,
                  timeEnd: state.timeEnd,
                  onTimeEndChosen: (time) => cubit.timeEndChanged(time),
                  onTimeStartChosen: (time) => cubit.timeStartChanged(time),
                ),
                DateProperty(
                  date: state.date,
                  onDateChosen: (date) => cubit.dateChanged(date),
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed:
              state.isSaveButtonEnabled
                  ? () => cubit.saveEvent()
                  : null,
            child: const Text("Создать"),
          ),
        ]),
      ),
    );
  }
}
