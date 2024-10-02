import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grofast/dependency_setup.dart';
import 'package:grofast/features/auth/presentation/logic/cubit/login/login_cubit.dart';
import 'package:grofast/features/auth/presentation/pages/login/login_page.dart';
import 'package:grofast/features/auth/presentation/pages/register/register_page.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/others/presentation/onboarding/onboarding_page.dart';

part 'route_names.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.onboarding,
  routes: [
    GoRoute(
      path: Routes.onboarding,
      name: Routes.onboarding,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => BlocProvider.value(
        value: getIt.get<LoginCubit>(),
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const HomePage(),
    )
  ],
);
