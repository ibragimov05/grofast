import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grofast/core/core.dart';
import 'package:grofast/features/auth/data/models/auth/user_secrets.dart';
import 'package:grofast/features/auth/data/models/auth/login_request.dart';
import 'package:grofast/services/log_service.dart';

part '../../data/repository/auth_repository_impl.dart';

sealed class AuthRepository {
  const AuthRepository();

  Future<Either<Failure, UserSecrets>> login({
    required AuthRequest request,
  });

  Future<Either<Failure, UserSecrets>> register({
    required AuthRequest request,
  });

  Future<Either<Failure, UserSecrets?>> checkTokenExpiry();
}
