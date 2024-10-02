import 'package:flutter/material.dart';
import 'package:grofast/core/theme/app_colors.dart';
import 'package:grofast/core/utils/app_utils.dart';

class GrofastButton extends StatelessWidget {
  final String buttonLabel;

  final void Function()? onTap;

  const GrofastButton({
    super.key,
    required this.buttonLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppUtils.kBorderRadius100,
      child: Ink(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: AppUtils.kBorderRadius100,
          color: onTap == null ? AppColors.c9C9C9C : null,
          gradient: onTap == null
              ? null
              : LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.c26AD71,
                    AppColors.c32CB4B,
                  ],
                ),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
