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
  /// Must be formatted in ISO 8601
  /// example: DateTime.now().toIso8601String()
  final String date;

  /// The consent type TODO: Find out if we can use a enum for that
  final String? consentType;

  @override
  List<Object?> get props => [
        granted,
        date,
        consentType,
      ];
}
