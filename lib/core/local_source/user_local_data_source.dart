abstract interface class UserLocalDataSource {
  Future<void> setAccessToken({required String accessToken});

  String get accessToken;

  Future<void> setRefreshToken({required String refreshToken});

  String get refreshToken;

  Future<void> setName({required String name});

  String get name;

  Future<void> setID({required String id});

  String get id;

  Future<void> setEmail({required String email});

  String get email;
}
