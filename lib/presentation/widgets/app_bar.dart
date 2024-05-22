import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget{

  MyAppBar({
    super.key,
    required this.title,
    required this.appBar,
    List<Widget>? actions,
    this.showBackArrow = true
  }) : actions = actions ?? [];

  final List<Widget> actions;
  final String title;
  final AppBar appBar;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge
      ),
      leading: showBackArrow ? IconButton(
          icon: Assets.icons.icBackArrow.image(height: 30, width: 30),
          onPressed: ()  => context.pop()
      ) : null,
      automaticallyImplyLeading: showBackArrow,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
