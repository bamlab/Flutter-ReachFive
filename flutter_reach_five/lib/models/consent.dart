import 'package:equatable/equatable.dart';

/// [Consent] class, contains the infos for a consent
class Consent extends Equatable {
  /// [Consent] default constructor
  const Consent({
    required this.granted,
    required this.date,
    this.consentType,
  });

  /// The consent granted
  final bool granted;

  /// The date the consent was last updated
  final DateTime date;

  /// The consent type TODO: Find out if we can use a enum for that
  final String? consentType;

  @override
  List<Object?> get props => [
        granted,
        date,
        consentType,
      ];
}
