import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/icons.dart';

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
        context.go(Routes.schedule.path);
      case 1:
        context.go(Routes.preferences.path);
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
            icon: CustomIcons.schedule.image(),
            activeIcon: CustomIcons.schedule.image(active: true),
            label: "Schedule",
          ),
          BottomNavigationBarItem(
              icon: CustomIcons.settings.image(),
              activeIcon: CustomIcons.settings.image(active: true),
              label: "Preferences"
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }


}