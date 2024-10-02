import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grofast/core/extension/build_context_extension.dart';
import 'package:grofast/core/theme/app_colors.dart';
import 'package:grofast/core/utils/app_assets.dart';
import 'package:grofast/core/utils/app_utils.dart';
import 'package:grofast/core/utils/device_screen.dart';
import 'package:grofast/core/widgets/grofast_button.dart';
import 'package:grofast/core/widgets/grofast_text_from_field.dart';
import 'package:grofast/core/widgets/zoom_tap_animation.dart';
import 'package:grofast/features/auth/presentation/logic/cubit/login/login_cubit.dart';
import 'package:grofast/router/app_router.dart';
import 'package:grofast/services/log_service.dart';

part 'widgets/login_page_private_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final double sH = DeviceScreen.h(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppUtils.kPaddingHor24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const _WelcomeBackText(),
              SizedBox(
                height: sH / 4,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _EmailAddressTextFormField(),
                    _PasswordTextFormField(),
                  ],
                ),
              ),
              SizedBox(
                height: sH / 4.5,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _SignInButton(),
                    _OrWithText(),
                    _AuthenticateWithGoogle(),
                  ],
                ),
              ),
              const _SignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
