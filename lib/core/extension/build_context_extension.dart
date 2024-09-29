import 'package:flutter/material.dart';

import '../l10n/localization.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  bool get isDarkMode => theme.brightness == Brightness.dark;

  Localization get localization => Localization.of(this);
}
