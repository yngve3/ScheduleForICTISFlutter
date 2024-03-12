import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../route/routes.dart';
import '../../theme/colors.dart';

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
        GoRouter.of(context).go(Routes.schedule.path);
      case 1:
        GoRouter.of(context).go(Routes.preferences.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: CustomColors.accentColor,
        selectedIconTheme: const IconThemeData(
            color: CustomColors.accentColor
        ),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/ic_schedule/ic_schedule.png", width: 27, height: 27),
            activeIcon: Image.asset("assets/icons/ic_schedule/ic_schedule_active.png", width: 27, height: 27),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
              icon: Image.asset("assets/icons/ic_settings/ic_settings.png", width: 27, height: 27),
              activeIcon: Image.asset("assets/icons/ic_settings/ic_settings_active.png", width: 27, height: 27),
              label: "Preferences"
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }


}