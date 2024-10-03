abstract interface class UserLocalDataSource {
  /// [localID]
  String get localID;

  Future<void> setLocalId({required String localID});

  /// [email]
  String get email;

  Future<void> setEmail({required String email});

  /// [idToken]
  String get idToken;

  Future<void> setIdToken({required String idToken});

  /// [refreshToken]
  String get refreshToken;

  Future<void> setRefreshToken({required String refreshToken});

  /// [expiresIn]
  String get expiresIn;

  Future<void> setExpiresIn({required String expiresIn});

  /// [fullName]
  String get fullName;

  Future<void> setFullName({required String fullName});
}
