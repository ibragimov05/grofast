import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grofast/core/core.dart';
import 'package:grofast/features/auth/data/models/auth/login_request.dart';
import 'package:grofast/features/auth/data/models/auth/user_secrets.dart';
import 'package:grofast/features/auth/domain/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const AuthState()) {
    on<AuthEvent>(
      (AuthEvent events, Emitter<AuthState> emit) => events.map(
        login: (event) => _onLogin(event, emit),
        googleAuth: (event) => _onGoogleAuth(event, emit),
        signUp: (event) => _onSignUp(event, emit),
        resetPassword: (event) => _onResetPassword(event, emit),
        checkTokenExpiry: (event) => _onCheckTokenExpiry(event, emit),
        logOut: (event) => _onLogOut(event, emit),
      ),
    );
  }

  Future<void> _onLogin(
    LoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    final result = await _authRepository.login(
      request: event.request,
    );

    result.fold(
      (Failure left) => emit(state.copyWith(
        authStatus: AuthStatus.unauthenticated,
        error: left.message,
      )),
      (UserSecrets r) async {
        
        emit(state.copyWith(authStatus: AuthStatus.authenticated));
      },
    );
  }

  Future<void> _onGoogleAuth(
    GoogleAuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
  }

  Future<void> _onCheckTokenExpiry(
    CheckTokenExpiryEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
  }

  Future<void> _onLogOut(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
  }
}
