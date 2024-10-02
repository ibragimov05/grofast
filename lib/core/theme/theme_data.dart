import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'cupertino_page_transitions_builder_custom_back_gesture_width.dart';

final ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.ralewayTextTheme(),
  useMaterial3: true,
  textSelectionTheme: TextSelectionThemeData(
    selectionHandleColor: AppColors.c32CB4B,
    selectionColor: AppColors.c32CB4B.withOpacity(0.3),
    cursorColor: AppColors.c32CB4B,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.iOS:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  ),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: AppColors.white,
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => IconButton(
      onPressed: () => Navigator.maybePop(context),
      icon: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(Icons.arrow_back_ios_new_rounded),
    ),
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  textTheme: GoogleFonts.ralewayTextTheme(),
);
