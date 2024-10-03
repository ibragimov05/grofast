import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/logic.dart';
import '../../../../../core/core.dart';
import '../../../../../router/app_router.dart';
import '../../../../../services/services.dart';

part 'widgets/login_page_private_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: const IntrinsicHeight(
                    child: Padding(
                      padding: AppUtils.kPaddingHor24,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AppUtils.kGap24,
                              _WelcomeBackText(),
                              AppUtils.kGap32,
                              _EmailAddressTextFormField(),
                              AppUtils.kGap16,
                              _PasswordTextFormField(),
                              AppUtils.kGap24,
                              _SignInButton(),
                            ],
                          ),
                          Column(
                            children: [
                              AppUtils.kGap24,
                              _OrWithText(),
                              AppUtils.kGap16,
                              _AuthenticateWithGoogle(),
                              AppUtils.kGap24,
                              _SignUpButton(),
                              AppUtils.kGap24,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
