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
  Future<Either<Failure, UserSecrets?>> checkTokenExpiry() async {
    throw UnimplementedError();
  }
}