import './open_id_user.dart';

/// AuthToken class, contains the infos of an authentication token
class AuthToken {
  /// AuthToken default constructor
  const AuthToken({
    required this.accessToken,
    this.idToken,
    this.refreshToken,
    this.tokenType,
    this.expiresIn,
    this.user,
  });

  /// The access token
  final String accessToken;

  /// The id token
  final String? idToken;

  /// The refresh token
  final String? refreshToken;

  /// The type of the token
  final String? tokenType;

  /// When your token expires TODO: See to convert it in a DateTime
  final int? expiresIn;

  /// Your user Informations linked to this token
  final OpenIdUser? user;
}
