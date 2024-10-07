import 'package:grofast/core/local_source/onboarding_local_data_source.dart';
import 'package:grofast/core/local_source/user_local_data_source.dart';
import 'package:grofast/core/local_source/preference_dao/preference_dao.dart';

final class LocalSource extends PreferenceDao
    implements UserLocalDataSource, OnboardingLocalDataSource {
  const LocalSource({required super.sharedPreferences});

  /// *** [UserLocalDataSource] entry ***
  PreferenceEntry<String> get _emailKey => stringEntry(key: 'user.email');

  PreferenceEntry<String> get _idTokenKey => stringEntry(key: 'user.id_token');

  PreferenceEntry<String> get _localIDKey => stringEntry(key: 'user.local_id');

  PreferenceEntry<String> get _expiresInKey =>
      stringEntry(key: 'user.expires_in');

  PreferenceEntry<String> get _refreshTokenKey =>
      stringEntry(key: 'user.refresh_token');

  PreferenceEntry<String> get _fullNameKey =>
      stringEntry(key: 'user.full_name');

  /// *** [OnboardingLocalDataSource] entry ***
  PreferenceEntry<bool> get _isOnboardingPassed =>
      boolEntry(key: 'settings.is_onboarding_passed');

  /// *** GETTERS ***
  /// [UserLocalDataSource]
  @override
  String get email => _emailKey.read() ?? '';

  @override
  String get expiresIn => _expiresInKey.read() ?? '';

  @override
  String get idToken => _idTokenKey.read() ?? '';

  @override
  String get localID => _localIDKey.read() ?? '';

  @override
  String get refreshToken => _refreshTokenKey.read() ?? '';

  @override
  String get fullName => _fullNameKey.read() ?? '';

  /// *** [OnboardingLocalDataSource] ***
  @override
  bool get isOnboardingLocalePassed => _isOnboardingPassed.read() ?? false;

  /// *** SETTERS ***
  /// *** [UserLocalDataSource] ***
  @override
  Future<void> setEmail({required String email}) async =>
      await _emailKey.set(email);

  @override
  Future<void> setExpiresIn({required String expiresIn}) async =>
      await _expiresInKey.set(expiresIn);

  @override
  Future<void> setIdToken({required String idToken}) async =>
      await _idTokenKey.set(idToken);

  @override
  Future<void> setLocalId({required String localID}) async =>
      await _localIDKey.set(localID);

  @override
  Future<void> setRefreshToken({required String refreshToken}) async =>
      await _refreshTokenKey.set(refreshToken);

  @override
  Future<void> setFullName({required String fullName}) async =>
      await _fullNameKey.set(fullName);

  /// *** [OnboardingLocalDataSource] ***
  @override
  Future<void> setIsOnboardingLocalePassed({
    required bool isOnboardingLocalePassed,
  }) async =>
      await _isOnboardingPassed.set(isOnboardingLocalePassed);

  Future<void> clearUserData() async => await Future.wait([
        _emailKey.remove(),
        _idTokenKey.remove(),
        _localIDKey.remove(),
        _fullNameKey.remove(),
        _expiresInKey.remove(),
        _refreshTokenKey.remove(),
      ]);

  Future<void> clearAllData() async {
    throw UnimplementedError();

    // await Future.wait(
    //   [],
    // );
  }
}
