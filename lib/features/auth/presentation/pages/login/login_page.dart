import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grofast/features/auth/data/models/auth/login_request.dart';
import 'package:grofast/features/auth/presentation/logic/bloc/auth/auth_bloc.dart';

import '../../logic/logic.dart';
import '../../../../../core/core.dart';
import '../../../../../router/app_router.dart';
import '../../../../../services/services.dart';

part 'widgets/login_page_private_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            context.go(Routes.home);
          }
          if (state.isError) {
            AppUtils.showToast(message: state.error.toString());
          }
        },
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
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

                                /// Welcome back text
                                _WelcomeBackText(),
                                AppUtils.kGap32,

                                /// Email address TextFormField
                                _EmailAddressTextFormField(),
                                AppUtils.kGap16,

                                /// Password TextFormField
                                _PasswordTextFormField(),
                                AppUtils.kGap24,

                                /// SignIn button
                                _SignInButton(),
                              ],
                            ),
                            Column(
                              children: [
                                AppUtils.kGap24,

                                /// or with text
                                _OrWithText(),
                                AppUtils.kGap16,

                                /// Authenticate with google button
                                _AuthenticateWithGoogle(),
                                AppUtils.kGap24,

                                /// Sign up button
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
        ),
      );
}
