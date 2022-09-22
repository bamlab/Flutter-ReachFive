/// Type of the token you want to revoke
enum RevokeTokenType {
  /// a refresh token
  refresh,

  /// an access token
  access
}

/// Map extension on the RevokeTokenType enum
extension RevokeTokenTypeMap on RevokeTokenType {
  /// map method for the RevokeTokenType enum
  T map<T>({required T refresh, required T access}) {
    switch (this) {
      case RevokeTokenType.refresh:
        return refresh;
      case RevokeTokenType.access:
        return access;
    }
  }
}
