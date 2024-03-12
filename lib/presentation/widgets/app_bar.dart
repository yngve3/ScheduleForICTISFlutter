import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          icon: Image.asset("assets/icons/ic_back_arrow.png", width: 32, height: 32),
          onPressed: ()  => context.pop()
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
