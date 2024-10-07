import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: InkWell(
          //   onTap: () {},
          //   borderRadius: AppUtils.kBorderRadius100,
          //   child: Ink(
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       border: Border.all(color: AppColors.c777777),
          //     ),
          //     child: Padding(
          //       padding: AppUtils.kPaddingAll12,
          //       child: AppAssets.icons.arrowRight.svg(),
          //     ),
          //   ),
          // ),
          ),
      body: const Center(
        child: FlutterLogo(size: 350),
      ),
    );
  }
}
