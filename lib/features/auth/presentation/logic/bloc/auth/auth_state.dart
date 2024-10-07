part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus authStatus,
    String? error,
  }) = _AuthState;
}

/// Extension to check [AuthStatus]
extension AuthStateX on AuthState {
  bool get isInitial => authStatus == AuthStatus.initial;

  bool get isLoading => authStatus == AuthStatus.loading;

  bool get isAuthenticated => authStatus == AuthStatus.authenticated;

  bool get isUnauthenticated => authStatus == AuthStatus.unauthenticated;

  bool get isError => authStatus == AuthStatus.error;
}
