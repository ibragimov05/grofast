part of '../login_page.dart';

class _WelcomeBackText extends StatelessWidget {
  const _WelcomeBackText();

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            context.localization.welcomeBack,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.c194B38,
              fontSize: 28,
            ),
          ),
        ],
      );
}

class _EmailAddressTextFormField extends StatelessWidget {
  const _EmailAddressTextFormField();

  @override
  Widget build(BuildContext context) {
    return GroFastTextFromField(
      labelText: context.localization.emailAddress,
      hintText: 'email@gmail.com',
      prefixIcon: AppAssets.icons.email.svg(),
    );
  }
}

class _PasswordTextFormField extends StatelessWidget {
  const _PasswordTextFormField();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GroFastTextFromField(
          isObscure: true,
          labelText: context.localization.password,
          hintText: '************',
          prefixIcon: AppAssets.icons.passwordLock.svg(),
        ),
        AppUtils.kGap4,
        GestureDetector(
          onTap: () => LogService.i('FORGOT PASSWORD'),
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.c9C9C9C,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );

    return GrofastButton(
      buttonLabel: context.localization.signIn,
      onTap: null,
    );
  }
}

class _OrWithText extends StatelessWidget {
  const _OrWithText();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.orWith,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.c4B4B4B,
      ),
    );
  }
}

class _AuthenticateWithGoogle extends StatelessWidget {
  const _AuthenticateWithGoogle();

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () {},
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: AppColors.cf1f5f3,
          borderRadius: AppUtils.kBorderRadius20,
        ),
        child: Center(
          child: AppAssets.icons.google.svg(),
        ),
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp();

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: () => context.pushNamed(Routes.register),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: context.localization.newUser,
              style: TextStyle(color: AppColors.c9C9C9C),
            ),
            const TextSpan(text: ' '),
            TextSpan(
              text: context.localization.signUp,
              style: TextStyle(
                color: AppColors.c32CB4B,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
