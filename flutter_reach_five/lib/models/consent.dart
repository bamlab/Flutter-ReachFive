/// Consent class, contains the infos for a consent
class Consent {
  /// Consent default constructor
  const Consent({
    required this.granted,
    required this.date,
    this.consentType,
  });

  /// The consent granted
  final bool granted;

  /// The date the consent was granted TODO: confirm that and try to use DateTime with good conversion
  final String date;

  /// The consent type TODO: Find out if we can use a enum for that
  final String? consentType;
}
