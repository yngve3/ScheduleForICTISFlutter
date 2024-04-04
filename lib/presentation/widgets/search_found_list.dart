import 'package:flutter/cupertino.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/schedule_subject_widget.dart';

import '../../domain/models/schedule_subject/schedule_subject.dart';

class SearchFoundList extends StatelessWidget {
  const SearchFoundList({
    super.key,
    required this.list,
    required this.onTapped
  });

  final List<ScheduleSubject> list;
  final ScheduleSubjectTappedCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 5,
              direction: Axis.horizontal,
              children: list.map((e) => ScheduleSubjectWidget(
                  scheduleSubject: e,
                  callback: (element) {
                    onTapped(element);
                  }
              )
              ).toList(),
            ),
          ),
        )
    );
  }
}