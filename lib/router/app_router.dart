import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:grofast/dependency_setup.dart';
import 'package:grofast/features/auth/domain/repository/auth_repository.dart';
import 'package:grofast/features/auth/presentation/logic/bloc/auth/auth_bloc.dart';
import 'package:grofast/features/auth/presentation/logic/cubit/login/login_cubit.dart';
import 'package:grofast/features/auth/presentation/pages/login/login_page.dart';
import 'package:grofast/features/auth/presentation/pages/register/register_page.dart';
import 'package:grofast/features/others/presentation/splash/splash_page.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/others/presentation/onboarding/onboarding_page.dart';

part 'route_names.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.onboarding,
      name: Routes.onboarding,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const OnboardingPage(),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: getIt.get<AuthRepositoryImpl>(),
            ),
          ),
          BlocProvider(create: (context) => LoginCubit()),
        ],
        child: const LoginPage(),
      ),
    ),
    GoRoute(
      path: Routes.register,
      name: Routes.register,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const HomePage(),
    )
  ],
);
