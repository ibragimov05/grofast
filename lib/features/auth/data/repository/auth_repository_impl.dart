part of '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final Dio _dio;

  const AuthRepositoryImpl({required Dio dio}) : _dio = dio;

  static final String _firebaseApiKey = dotenv.get('FIREBASE_WEB_API_KEY');
  static const String _baseUrl = 'https://identitytoolkit.googleapis.com/v1';

  /// Authenticates user by the given [query]
  Future<UserSecrets> _authenticate({
    required AuthRequest request,
    required String query,
  }) async {
    final String url = "$_baseUrl/accounts:$query?key=$_firebaseApiKey";

    try {
      final response = await _dio.post(
        url,
        data: request.toMap(),
      );

      if (response.statusCode != null &&
          (response.statusCode! >= 200 && response.statusCode! < 299)) {
        response.data['expiresIn'] = DateTime.now().add(
          Duration(
            seconds: int.parse(response.data['expiresIn']),
          ),
        );

        final user = UserSecrets.fromJson(response.data);

        return user;
      } else {
        throw Exception('Something went wrong: ${response.data}');
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, UserSecrets>> login({
    required AuthRequest request,
  }) async {
    try {
      final authResponse = await _authenticate(
        request: request,
        query: 'signInWithPassword',
      );

      return Right<Failure, UserSecrets>(authResponse);
    } on DioException catch (error, stacktrace) {
      LogService.e('Exception occurred: $error stacktrace: $stacktrace');

      return Left<Failure, UserSecrets>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      LogService.e('Exception occurred: $error stacktrace: $stacktrace');

      return Left<Failure, UserSecrets>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }

  @override
  Future<Either<Failure, UserSecrets>> register({
    required AuthRequest request,
  }) async {
    try {
      final authResponse = await _authenticate(
        request: request,
        query: 'signUp',
      );

      return Right<Failure, UserSecrets>(authResponse);
    } on DioException catch (error, stacktrace) {
      LogService.e('Exception occurred: $error stacktrace: $stacktrace');

      return Left<Failure, UserSecrets>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      LogService.e('Exception occurred: $error stacktrace: $stacktrace');

      return Left<Failure, UserSecrets>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkTokenExpiry() async {
    try {
      final expiresIn = localSource.expiresIn;

      if (expiresIn.isEmpty) {
        return const Right<Failure, bool>(false);
      }

      final expiresInDateTime = DateTime.parse(localSource.expiresIn);

      if (DateTime.now().isBefore(expiresInDateTime)) {
        return const Right<Failure, bool>(true);
      } else {
        final newUser = await _refreshToken;
        return const Right<Failure, bool>(true);
        // final updateUser = await _refreshToken(user)
      }
    } catch (error, stacktrace) {
      LogService.e('Exception occurred: $error stacktrace: $stacktrace');

      return Left<Failure, bool>(Error.throwWithStackTrace(error, stacktrace));
    }
  }

  Future<UserSecrets> _refreshToken({required String refreshToken}) async {
    final String url =
        "https://securetoken.googleapis.com/v1/token?key=$_firebaseApiKey";

    try {
      final response = await _dio.post(
        url,
        data: {
          "grant_type": "refresh_token",
          "refresh_token": refreshToken,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;

        return UserSecrets.fromJson(data);
      } else {
        throw Exception(response.data['error']['message']);
      }
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ?? 'Failed to refresh token';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
