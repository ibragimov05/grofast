part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required AuthRequest request,
  }) = LoginEvent;

  const factory AuthEvent.googleAuth() = GoogleAuthLogin;

  const factory AuthEvent.signUp({
    required String fullName,
    required AuthRequest request,
  }) = SignUpEvent;

  const factory AuthEvent.resetPassword({
    required String email,
  }) = ResetPasswordEvent;

  const factory AuthEvent.checkTokenExpiry() = CheckTokenExpiryEvent;

  const factory AuthEvent.logOut() = LogoutEvent;
}
