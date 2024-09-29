import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grofast/core/theme/app_colors.dart';
import 'package:grofast/core/theme/cupertino_page_transitions_builder_custom_back_gesture_width.dart';

final ThemeData lightTheme = ThemeData(
  textTheme: GoogleFonts.ralewayTextTheme(ThemeData.light().textTheme),
  useMaterial3: true,
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.iOS:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  ),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
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
  textTheme: GoogleFonts.ralewayTextTheme(ThemeData.dark().textTheme),
);
