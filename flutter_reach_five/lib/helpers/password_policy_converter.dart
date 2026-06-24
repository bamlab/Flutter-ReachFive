import 'package:reach_five_identity_repo/reach_five_identity_repo.dart'
    as identity_repo;

import '../models/password_policy.dart';

/// Used to be the link between the [identity_repo.PasswordPolicy] from the
/// identity repo and the [PasswordPolicy] exported from this package
class PasswordPolicyConverter {
  /// convert a [identity_repo.PasswordPolicy] to a [PasswordPolicy]
  static PasswordPolicy fromInterface(
    identity_repo.PasswordPolicy passwordPolicy,
  ) => PasswordPolicy(
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
