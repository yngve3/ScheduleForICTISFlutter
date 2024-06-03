import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/data/repositories/auth_repository.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/theme_mode.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/app_bar.dart';
import 'package:schedule_for_ictis_flutter/utils/constants/callbacks.dart';

import '../../../gen/assets.gen.dart';
import '../../app/cubit/app_cubit.dart';
import '../../route/routes.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        appBar: AppBar(),
        title: "Настройки",
        showBackArrow: false,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: PreferencesList(),
      ),
    );
  }
}

class PreferencesList extends StatelessWidget {
  const PreferencesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PreferenceTitle(title: "Цветовая схема"),
        PreferenceThemeMode(
          onThemeModeChange: (mode) => context.read<AppCubit>().changeThemeMode(mode),
        ),
        const PreferenceTitle(title: "Расписание"),
        PreferenceItem(
          title: "Избранные расписания",
          subtitle: "Настройка быстрого доступа к расписаниям",
          onItemTapped: () => context.push(Routes.favoriteSchedules.path)
        ),
        PreferenceItem(
          title: "Выход",
          subtitle: "",
          onItemTapped: () async {
            await AuthRepository().logOut();
            context.go(Routes.login.path);
          }
        ),
      ],
    );
  }
}

class PreferenceThemeMode extends StatefulWidget {
  const PreferenceThemeMode({
    super.key,
    required this.onThemeModeChange
  });

  final ThemeModeCallback onThemeModeChange;

  @override
  State<PreferenceThemeMode> createState() => _PreferenceThemeModeState();
}

class _PreferenceThemeModeState extends State<PreferenceThemeMode> {
  @override
  Widget build(BuildContext context) {
    final selectedMode = BlocProvider.of<AppCubit>(context).state.mode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreferenceThemeModeTile(
          themeMode: ThemeMode.light,
          groupValue: selectedMode.index,
          onChanged: (value) {
            widget.onThemeModeChange(value);
            setState(() {});
          }
        ),
        PreferenceThemeModeTile(
          themeMode: ThemeMode.dark,
          groupValue: selectedMode.index,
          onChanged: (value) {
            widget.onThemeModeChange(value);
            setState(() {});
          },
        ),
        PreferenceThemeModeTile(
          themeMode: ThemeMode.system,
          groupValue: selectedMode.index,
          onChanged: (value) {
            widget.onThemeModeChange(value);
            setState(() {});
          },
        ),
      ],
    );
  }
}


class PreferenceThemeModeTile extends StatelessWidget {
  const PreferenceThemeModeTile({
    super.key,
    required this.themeMode,
    required this.groupValue,
    required this.onChanged
  });

  final ThemeMode themeMode;
  final int groupValue;
  final ThemeModeCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(themeMode),
      child: Container(
        decoration: groupValue == themeMode.index ? BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: context.colorScheme.primary, width: 2)
        ) : null,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _getImage(themeMode),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(_getThemeModeName(themeMode)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: context.colorScheme.surface,
              ),
            )
          ],
        ),
      ),
    );
  }

  String _getThemeModeName(ThemeMode themeMode) {
    return switch(themeMode) {
      ThemeMode.dark => "Темная",
      ThemeMode.light => "Светлая",
      ThemeMode.system => "Авто",
    };
  }

  Widget _getImage(ThemeMode themeMode) {
    return Assets.icons.icSchedule.image(fit: BoxFit.fitHeight, height: 110, width: 110, color: Colors.white);
  }
}

class PreferenceTitle extends StatelessWidget {
  const PreferenceTitle({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        title,
        style: context.textTheme.headlineMedium,
      ),
    );
  }
}

class PreferenceItem extends StatelessWidget {
  const PreferenceItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onItemTapped
  });

  final String title;
  final String subtitle;
  final VoidCallback onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
          child: ListTile(
              title: Text(title, style: context.textTheme.titleLarge),
              subtitle: Text(subtitle, style: context.textTheme.bodyMedium)
          ),
          onTap: () => onItemTapped(),
        )
    );
  }
}