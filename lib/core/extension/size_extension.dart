import 'dart:io';

import 'package:flutter/material.dart';

extension SizeExtension on BuildContext {
  bool get isMobile =>
      kSize.width < 600 && (Platform.isAndroid || Platform.isIOS);

  bool get isTablet =>
      kSize.width > 600 && (Platform.isAndroid || Platform.isIOS);

  Size get kSize => MediaQuery.sizeOf(this);

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;
}

extension OrientationExtension on Orientation {
  bool get isPortrait => this == Orientation.portrait;
}
