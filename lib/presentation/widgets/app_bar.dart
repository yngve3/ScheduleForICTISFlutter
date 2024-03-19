import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/theme/icons.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{

  MyAppBar({
    super.key,
    required this.title,
    required this.appBar,
    List<Widget>? actions
  }) : actions = actions ?? [];

  List<Widget> actions;
  final String title;
  final AppBar appBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge
      ),
      leading: IconButton(
          icon: CustomIcons.backArrow,
          onPressed: ()  => context.pop()
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
