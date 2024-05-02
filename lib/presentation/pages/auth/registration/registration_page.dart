import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/extensions/context_ext.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/auth/registration/cubit/registration_page_cubit.dart';

import '../../../route/routes.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/screen.dart';
import 'cubit/registration_page_state.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationPageCubit(),
      child: BlocConsumer<RegistrationPageCubit, RegistrationPageState>(
        listener: (context, state) {
          if (!state.isRegister && state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state.isRegister) {
            // context.push(Routes.favoriteSchedules.lastPathComponent);
          }
        },
        builder: (context, state) {
          final emailController = TextEditingController();
          final passwordController = TextEditingController();
          return Scaffold(
            body: Screen(
              padding: const EdgeInsets.only(top: 50, bottom: 10, left: 15, right: 15),
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Text("Регистрация", style: context.textTheme.headlineLarge),
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
                        ],
                      )
                  ),
                  FilledButton(
                    onPressed: () {
                      context.push(Routes.favoriteSchedules.lastPathComponent);
                      // context.read<RegistrationPageCubit>().register(
                      //     email: emailController.text,
                      //     password: passwordController.text
                      // );
                    },
                    child: Text(
                      "Далее",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: context.customColors.background),
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text("Войти", style: context.textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

