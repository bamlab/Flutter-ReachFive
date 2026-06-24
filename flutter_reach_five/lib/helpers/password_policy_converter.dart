import 'package:reach_five_identity_repo/reach_five_identity_repo.dart';

import '../models/password_policy.dart';

/// Used as the link between the [PasswordPolicyResponse] from the
/// identity repo and the [PasswordPolicy] exported from this package
class PasswordPolicyConverter {
  /// convert a [PasswordPolicyResponse] to a [PasswordPolicy]
  static PasswordPolicy fromInterface(PasswordPolicyResponse passwordPolicy) =>
      PasswordPolicy(
        minLength: passwordPolicy.minLength,
        minStrength: passwordPolicy.minStrength,
        specialCharacters: passwordPolicy.specialCharacters,
        uppercaseCharacters: passwordPolicy.uppercaseCharacters,
        lowercaseCharacters: passwordPolicy.lowercaseCharacters,
        digitCharacters: passwordPolicy.digitCharacters,
        allowUpdateWithAccessTokenOnly:
            passwordPolicy.allowUpdateWithAccessTokenOnly,
      );
}
