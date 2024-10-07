import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grofast/core/extension/build_context_extension.dart';
import 'package:grofast/core/extension/size_extension.dart';
import 'package:grofast/core/theme/app_colors.dart';
import 'package:grofast/core/utils/app_assets.dart';
import 'package:grofast/core/utils/app_utils.dart';
import 'package:grofast/core/widgets/zoom_tap_animation.dart';
import 'package:grofast/dependency_setup.dart';
import 'package:grofast/router/app_router.dart';

import '../../../../core/custom_painter/custom_painter.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double sW = context.width;
    final double sH = context.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: sH / 1.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppAssets.images.onboardingImage.path),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CurvedTopContainer(
              width: double.infinity,
              height: sH / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  Text(
                    context.localization.freshGrocery,
                    style: context.theme.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    context.localization.dumpText,
                    style: TextStyle(color: AppColors.c9C9C9C, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    width: sW / 2.5,
                    height: 95,
                    padding: AppUtils.kPaddingAll10,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.c2BAF6F),
                      borderRadius: AppUtils.kBorderRadius64,
                    ),
                    child: ZoomTapAnimation(
                      onTap: () {
                        context.go(Routes.login);
                        localSource.setIsOnboardingLocalePassed(
                          isOnboardingLocalePassed: true,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius64,
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.c32CB4B,
                              AppColors.c26AD71,
                            ],
                          ),
                        ),
                        child: Center(
                          child: AppAssets.icons.arrowForward.svg(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
