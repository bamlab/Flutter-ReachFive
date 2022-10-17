import 'package:equatable/equatable.dart';

/// [Emails] class, contains all the verified and unverified emails of an user
class Emails extends Equatable {
  /// [Emails] default constructor
  const Emails({
    this.verified,
    this.unverified,
  });

  /// all the verified emails of an user
  final List<String>? verified;

  /// all the unverified emails of an user
  final List<String>? unverified;

  @override
  List<Object?> get props => [
        verified,
        unverified,
      ];
}
