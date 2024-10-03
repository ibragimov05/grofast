part of 'preference_dao.dart';

/// An [abstract] class that serves as a template for any preference key,
/// meaning it defines how entries should have (read, set, remove).
/// It uses generic type [T] to support multiple data types (int, bool, String, etc.).
abstract base class PreferenceEntry<T extends Object> {
  const PreferenceEntry();

  /// A [key] used to identify the specific preference entry in [SharedPreferences].
  String get key;

  /// Reads the stored value from [SharedPreferences]. Returns [null] if no value exists.
  T? read();

  /// Sets a value in [SharedPreferences]. This will be implemented by a subclass.
  Future<void> set(T value);

  /// Removes the value stored in [SharedPreferences] for this entry.
  Future<void> remove();

  /// Sets the value if it is not [null], otherwise removes the entry
  Future<void> setIfNullRemove(T? value) =>
      value == null ? remove() : set(value);
}

/// This is a actual implementation of the abstract class [PreferenceEntry<T>] class.
/// It provides the logic for reading, writing and removing entries.
final class _PreferenceEntry<T extends Object> extends PreferenceEntry<T> {
  _PreferenceEntry({
    required SharedPreferences sharedPreferences,
    required this.key,
  }) : _sharedPreferences = sharedPreferences;

  /// Holds the [SharedPreferences] instance, which is used to interact with saved data.
  final SharedPreferences _sharedPreferences;

  /// The key used to store and retrieve the specific entry in [SharedPreferences]
  @override
  final String key;

  /// Reads a value from [SharedPreferences] based on the key.
  /// If the value exists and matches the expected type, it returns it.
  /// If there's no value or the type is wrong, it throws an error or returns [null]
  @override
  T? read() {
    final value = _sharedPreferences.get(key);

    return switch (value) {
      null => null, // If no value is found, return null.
      final T v => v, // If value matches the expected type, return it
      _ => throw Exception(
          // If the value is of wrong type, throw an error
          'The value of $key is not subtype ${T.runtimeType}',
        )
    };
  }

  /// Removes value from [SharedPreferences] that is stored under the provided [key].
  @override
  Future<void> remove() => _sharedPreferences.remove(key);

  /// Saves a value in [SharedPreferences]. Based on the type `T`, it calls appropriate method
  /// to store the value (e.g., [setInt], [setBool], [setString], etc.).
  /// If the type is not supported, it throws an error.
  @override
  Future<void> set(T value) => switch (value) {
        final int v =>
          _sharedPreferences.setInt(key, v), // Stores an int value.
        final double v =>
          _sharedPreferences.setDouble(key, v), // Stores a double value.
        final bool v =>
          _sharedPreferences.setBool(key, v), // Stores a bool value.
        final String v =>
          _sharedPreferences.setString(key, v), // Stores a string value.
        final Iterable<String> v => _sharedPreferences.setStringList(
            // Stores a list of strings.
            key,
            v.toList(),
          ),
        // Throws an error if the type isn't supported
        _ => throw Exception(
            '$T is not valid type for a preferences entry value',
          ),
      };
}
