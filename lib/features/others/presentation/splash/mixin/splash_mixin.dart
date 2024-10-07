part of '../splash_page.dart';

mixin SplashMixin on State<SplashPage> {
  late bool _didSeeOnboarding;

  @override
  void initState() {
    super.initState();
    _didSeeOnboarding = localSource.isOnboardingLocalePassed;

    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (!mounted) return;

        getIt.get<AuthBloc>().add(const AuthEvent.checkTokenExpiry());

        context.go(
          _didSeeOnboarding ? Routes.login : Routes.onboarding,
        );
      },
    );
  }
}
