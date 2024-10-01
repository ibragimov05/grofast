import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final GetIt getIt = GetIt.instance;

class DependencySetup {
  static void init() {
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

    /// registering blocs

    /// registering cubits
  }
}
