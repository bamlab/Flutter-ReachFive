import 'package:equatable/equatable.dart';

/// [PasswordPolicy] class, contains the password policy configured for the
/// ReachFive client (as defined on the Password policy page of the console)
class PasswordPolicy extends Equatable {
  /// [PasswordPolicy] default constructor
  const PasswordPolicy({
    required this.minLength,
    required this.minStrength,
    required this.allowUpdateWithAccessTokenOnly,
    this.specialCharacters,
    this.uppercaseCharacters,
    this.lowercaseCharacters,
    this.digitCharacters,
  });

  /// The minimum number of characters a password must contain
  final int minLength;

  /// The minimum strength a password must reach (from 0 to 4)
  final int minStrength;

  /// The minimum number of special characters a password must contain,
  /// or `null` if not enforced
  final int? specialCharacters;

  /// The minimum number of uppercase characters a password must contain,
  /// or `null` if not enforced
  final int? uppercaseCharacters;

  /// The minimum number of lowercase characters a password must contain,
  /// or `null` if not enforced
  final int? lowercaseCharacters;

  /// The minimum number of digit characters a password must contain,
  /// or `null` if not enforced
  final int? digitCharacters;

  /// Whether the password can be updated with only an access token
  /// (without providing the old password)
  final bool allowUpdateWithAccessTokenOnly;

  @override
  List<Object?> get props => [
    minLength,
    minStrength,
    specialCharacters,
    uppercaseCharacters,
    lowercaseCharacters,
    digitCharacters,
    allowUpdateWithAccessTokenOnly,
  ];
}
