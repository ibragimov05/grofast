import 'package:shared_preferences/shared_preferences.dart';

part 'preference_entry.dart';

/// An abstract class that helps manage preference in the app.
/// It's marked as `base` to ensure it's only extended, not implemented or mixed in
abstract base class PreferenceDao {
  const PreferenceDao({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  /// This holds the reference to the [SharedPreferences] object.
  final SharedPreferences _sharedPreferences;

  /// Creates a preference entry for storing and retrieving a [bool] value.
  PreferenceEntry<bool> boolEntry({required String key}) =>
      _PreferenceEntry<bool>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  /// Creates preference entry for storing and retrieving a [int] value.
  PreferenceEntry<int> intEntry({required String key}) => _PreferenceEntry<int>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  /// Creates preference entry for storing and retrieving a [double] value.
  PreferenceEntry<double> doubleEntry({required String key}) =>
      _PreferenceEntry<double>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );

  /// Creates preference entry for storing and retrieving a [String] value.
  PreferenceEntry<String> stringEntry({required String key}) =>
      _PreferenceEntry<String>(
        sharedPreferences: _sharedPreferences,
        key: key,
      );
}
