import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grofast/core/core.dart';
import 'package:grofast/core/extension/size_extension.dart';
import 'package:grofast/dependency_setup.dart';
import 'package:grofast/features/auth/presentation/logic/bloc/auth/auth_bloc.dart';
import 'package:grofast/router/app_router.dart';

part 'mixin/splash_mixin.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppAssets.images.grofastLogo.image(
          width: context.width / 3,
        ),
      ),
    );
  }
}
