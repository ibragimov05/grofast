class AuthRequest {
  final String email;
  final String password;

  const AuthRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
        'returnSecureToken': true,
      };
}
