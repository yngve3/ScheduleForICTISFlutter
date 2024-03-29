import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/schedule/cubit/schedule_cubit.dart';

import '../../../gen/assets.gen.dart';
import '../../route/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.child
  });

  final Widget child;

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(Routes.schedule.path)) {
      return 0;
    }
    if (location.startsWith(Routes.preferences.path)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.schedule.path);
      case 1:
        context.go(Routes.preferences.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ScheduleCubit(),
        child: child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: context.customColors.accent,
        selectedIconTheme: IconThemeData(
            color: context.customColors.accent
        ),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.icSchedule.image(color: context.customColors.text1),
            activeIcon: Assets.icons.icSchedule.image(color: context.customColors.accent),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
              icon: Assets.icons.icSettings.image(color: context.customColors.text1),
              activeIcon: Assets.icons.icSettings.image(color: context.customColors.accent),
              label: "Preferences"
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }
}