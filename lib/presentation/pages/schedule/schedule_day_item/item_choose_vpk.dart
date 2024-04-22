import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';

import '../../../route/routes.dart';

class ItemChooseVPK extends StatelessWidget {
  const ItemChooseVPK({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(Routes.addFavoriteSchedule.path),
      child: Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Text(
                "ВПК не выбрано, нажмите чтобы выбрать",
                style: context.textTheme.bodyLarge
            )
        ),
      ),
    );
  }

}