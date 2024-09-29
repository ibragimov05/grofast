import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'core/utils/utils.dart';
import 'dependency_setup.dart';

void main() async {
  if (kDebugMode) Bloc.observer = LogBlocObserver();

  DependencySetup.init();

  runApp(const App());
}
