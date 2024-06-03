import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/domain/interactors/schedule_interactor.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/home/cubit/home_page_cubit.dart';
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
    if (location.startsWith(Routes.home.path)) {
      return 0;
    }
    if (location.startsWith(Routes.schedule.path)) {
      return 1;
    }
    if (location.startsWith(Routes.preferences.path)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.home.path);
      case 1:
        context.go(Routes.schedule.path);
      case 2:
        context.go(Routes.preferences.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedIconColor = context.colorScheme.primary;
    final unselectedIconColor = context.colorScheme.onBackground;
    const iconSize = 30.0;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: context.colorScheme.background,
        systemNavigationBarColor: context.colorScheme.background,
      ),
      child: Scaffold(
        body: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => ScheduleCubit(ScheduleInteractor())
              ),
              BlocProvider(
                create: (context) => HomePageCubit(),
              ),
            ],
            child: child
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Assets.icons.icHome.image(color: unselectedIconColor, height: iconSize, width: iconSize),
                activeIcon: Assets.icons.icHome.image(color: selectedIconColor, height: iconSize, width: iconSize),
                label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Assets.icons.icSchedule.image(color: unselectedIconColor, height: iconSize, width: iconSize),
              activeIcon: Assets.icons.icSchedule.image(color: selectedIconColor, height: iconSize, width: iconSize),
              label: "Schedule",
            ),
            BottomNavigationBarItem(
                icon: Assets.icons.icSettings.image(color: unselectedIconColor, height: iconSize, width: iconSize),
                activeIcon: Assets.icons.icSettings.image(color: selectedIconColor, height: iconSize, width: iconSize),
                label: "Preferences"
            ),
          ],
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
        ),
      ),
    );
  }
}