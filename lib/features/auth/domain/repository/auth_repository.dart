import 'package:grofast/core/core.dart';
import 'package:grofast/features/auth/data/models/auth/auth_response.dart';
import 'package:grofast/features/auth/data/models/auth/login_request.dart';

part '../../data/repository/auth_repository_impl.dart';

sealed class AuthRepository {
  Future<Either<Failure, AuthResponse>> login({
    required AuthRequest request,
  });

  Future<Either<Failure, AuthResponse>> register({
    required AuthRequest request,
  });
}

// sealed class MovieRepository {
//   Future<Either<Failure, MovieResponse>> getMovies({
//     required MovieRequest request,
//   });
//
//   Future<Either<Failure, GenreResponse>> getMovieGenres();
// }
