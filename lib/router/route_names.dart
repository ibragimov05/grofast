part of 'app_router.dart';

sealed class Routes {
  const Routes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String main = '/main';
}
