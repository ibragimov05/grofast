part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticate, unauthenticated, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    String? error,
  }) = _AuthState;
}
