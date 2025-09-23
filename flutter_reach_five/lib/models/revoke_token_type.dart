/// Type of the token you want to revoke
enum RevokeTokenType {
  /// a refresh token
  refresh,

  /// an access token
  access
}

// coverage:ignore-start
/// Map extension on the RevokeTokenType enum
@Deprecated('Replace with Dart >=3 pattern matching using a switch statement.')
extension RevokeTokenTypeMap on RevokeTokenType {
  /// map method for the RevokeTokenType enum
  @Deprecated(
    'Replace with Dart >=3 pattern matching using a switch statement.',
  )
  T map<T>({required T refresh, required T access}) {
    switch (this) {
      case RevokeTokenType.refresh:
        return refresh;
      case RevokeTokenType.access:
        return access;
    }
  }
}
// coverage:ignore-end
