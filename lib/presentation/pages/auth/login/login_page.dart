import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/auth/login/cubit/login_page_cubit.dart';
import 'package:schedule_for_ictis_flutter/presentation/widgets/input_field.dart';

import '../../../route/routes.dart';
import '../../../widgets/screen.dart';
import 'cubit/login_page_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(),
      child: BlocConsumer<LoginPageCubit, LoginPageState>(
        listener: (context, state) {
          if (!state.isLogin && state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state.isLogin) {
            context.go(Routes.schedule.path);
          }
        },
        builder: (context, state) {
          final emailController = TextEditingController();
          final passwordController = TextEditingController();
          return Scaffold(
            body: Screen(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Вход", style: context.textTheme.headlineLarge),
                    const SizedBox(height: 20),
                    InputField(
                      label: "Введите логин",
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      label: "Введите пароль",
                      textInputAction: TextInputAction.next,
                      isPassword: true,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                        onPressed: () {
                          context.read<LoginPageCubit>().logIn(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim()
                          );
                        },
                        child: Text(
                          "Войти",
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: context.customColors.background)
                        )
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text("Регистирация", style: context.textTheme.bodyLarge)
                    ),
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
