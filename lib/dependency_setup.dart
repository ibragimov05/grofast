import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:grofast/features/auth/domain/repository/auth_repository.dart';
import 'package:grofast/features/auth/presentation/logic/bloc/auth/auth_bloc.dart';
import 'package:grofast/features/auth/presentation/logic/cubit/login/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/local_source/local_source.dart';

final GetIt getIt = GetIt.instance;

final LocalSource localSource = getIt.get<LocalSource>();

class DependencySetup {
  static Future<void> init() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    getIt.registerSingleton<LocalSource>(
      LocalSource(sharedPreferences: sharedPreferences),
    );

    getIt.registerLazySingleton(
      () => Dio()
        ..options = BaseOptions(
          contentType: 'application/json',
          sendTimeout: const Duration(seconds: 15),
          connectTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 15),
        )
        ..interceptors.add(LogInterceptor(
          error: kDebugMode,
          request: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          requestHeader: kDebugMode,
          responseHeader: kDebugMode,
          logPrint: (Object object) {
            if (kDebugMode) log("dio: $object");
          },
        )),
    );

    getIt.registerLazySingleton(() => Connectivity());
    getIt.registerLazySingleton(
      () => AuthRepositoryImpl(dio: getIt.get<Dio>()),
    );

    /// registering blocs
    getIt.registerLazySingleton(
      () => AuthBloc(
        authRepository: getIt.get<AuthRepositoryImpl>(),
      ),
    );

    /// registering cubits
    getIt.registerLazySingleton(() => LoginCubit());
  }
}
