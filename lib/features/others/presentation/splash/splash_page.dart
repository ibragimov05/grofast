import 'package:flutter/material.dart';
import 'package:grofast/core/extension/build_context_extension.dart';
import 'package:grofast/core/theme/app_colors.dart';
import 'package:grofast/core/theme/app_text_styles.dart';
import 'package:grofast/core/utils/app_assets.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cEAF3F0,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              child: AppAssets.icons.grofast.svg(),
            ),
            Text(
              context.localization.grofast,
              style: AppTextStyles.w900.copyWith(
                color: AppColors.c194B38,
                fontStyle: FontStyle.italic,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
