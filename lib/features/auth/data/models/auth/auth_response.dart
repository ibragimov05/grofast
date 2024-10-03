class AuthResponse {
  final String localId;
  final String email;
  final String idToken;
  final String refreshToken;
  final DateTime expiresIn;

  const AuthResponse({
    required this.localId,
    required this.email,
    required this.idToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        localId: json['localId'] as String,
        email: json['email'] as String,
        idToken: json['idToken'] as String,
        refreshToken: json['refreshToken'] as String,
        expiresIn: json['expiresIn'] is String
            ? DateTime.parse(json['expiresIn'] as String)
            : json['expiresIn'] as DateTime,
      );

  Map<String, dynamic> toJson() => {
        'localId': localId,
        'email': email,
        'idToken': idToken,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn.toIso8601String(),
      };

  @override
  String toString() =>
      'UserSecrets(localId: $localId, email: $email, idToken: $idToken, refreshToken: $refreshToken, expiresIn: $expiresIn)';
}
