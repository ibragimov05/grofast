import 'package:grofast/core/local_source/preference_dao/preference_dao.dart';
import 'package:grofast/core/local_source/user_local_data_source.dart';

final class LocalSource extends PreferenceDao implements UserLocalDataSource {
  const LocalSource({required super.sharedPreferences});

  PreferenceEntry<String> get _accessKey => stringEntry(key: 'user.access');

  PreferenceEntry<String> get _refreshKey => stringEntry(key: 'user.refresh');

  PreferenceEntry<String> get _nameKey => stringEntry(key: 'user.name');

  PreferenceEntry<String> get _imageKey => stringEntry(key: 'user.image');

  PreferenceEntry<String> get _emailKey => stringEntry(key: 'user.email');

  PreferenceEntry<String> get _idKey => stringEntry(key: 'user.id');

  /// *** GETTERS ***
  @override
  String get accessToken => _accessKey.read() ?? '';

  @override
  String get email => _emailKey.read() ?? '';

  @override
  String get id => _idKey.read() ?? '';

  @override
  String get name => _nameKey.read() ?? '';

  @override
  String get refreshToken => _refreshKey.read() ?? '';

  @override
  Future<void> setAccessToken({required String accessToken}) async =>
      _accessKey.set(accessToken);

  @override
  Future<void> setEmail({required String email}) async => _emailKey.set(email);

  @override
  Future<void> setID({required String id}) async => _idKey.set(id);

  @override
  Future<void> setName({required String name}) async => _nameKey.set(name);

  @override
  Future<void> setRefreshToken({required String refreshToken}) async =>
      _refreshKey.set(refreshToken);

  Future<void> clearAllData() async => await Future.wait([
        _accessKey.remove(),
        _refreshKey.remove(),
        _nameKey.remove(),
        _imageKey.remove(),
        _emailKey.remove(),
        _idKey.remove(),
      ]);
}
