import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/auth/login/cubit/login_page_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/input_field.dart';

import '../../../widgets/screen.dart';
import 'cubit/login_page_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (context, state) {
          return Scaffold(
            body: Screen(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Вход", style: context.textTheme.headlineLarge),
                    const SizedBox(height: 20),
                    const InputField(
                      label: "Введите логин",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    const InputField(
                      label: "Введите пароль",
                      textInputAction: TextInputAction.next,
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                        onPressed: () {},
                        child: Text("Войти")
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Регистирация")
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
