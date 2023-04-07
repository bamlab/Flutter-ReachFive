abstract class DataSet {
  const DataSet();

  /// Your data set name
  String get name;

  /// Your reach five domain
  String get initialDomain;

  /// Your reach five clientId
  String get initialClientId;

  /// Your reach five android scheme
  String get initialAndroidScheme;

  /// Your reach five ios scheme
  String get initialIosScheme;

  /// Your reach five origin
  String get initialOrigin;

  /// Your reach five account email
  String get initialEmail;

  /// Your reach five account password
  String get initialPassword;

  /// Your reach five account family name
  String get initialFamilyName;

  /// Your reach five account given name
  String get initialGivenName;

  /// Your reach five account middle name
  String get initialMiddleName;

  /// Your reach five account nickname
  String get initialNickame;

  /// Your reach five redirectUrl
  String get initialRedirectUrl;
}

class _FirstDataSet extends DataSet {
  const _FirstDataSet();

  /// Your data set name
  @override
  String get name => 'My First Instance Data Set';

  /// Your reach five domain
  @override
  String get initialDomain => '';

  /// Your reach five clientId
  @override
  String get initialClientId => '';

  /// Your reach five android scheme
  @override
  String get initialAndroidScheme => '';

  /// Your reach five ios scheme
  @override
  String get initialIosScheme => 'reachfive-$initialClientId://callback';

  /// Your reach five origin
  @override
  String get initialOrigin => '';

  /// Your reach five account email
  @override
  String get initialEmail => 'MyFirstInstanceuserEmail@email.com';

  /// Your reach five account password
  @override
  String get initialPassword => 'Super@123Mdp';

  /// Your reach five account family name
  @override
  String get initialFamilyName => 'MyFirstInstanceUserFamilyName';

  /// Your reach five account given name
  @override
  String get initialGivenName => 'MyFirstInstanceUserGivenName';

  /// Your reach five account middle name
  @override
  String get initialMiddleName => 'MyFirstInstanceUserMiddleName';

  /// Your reach five account nickname
  @override
  String get initialNickame => 'MyFirstInstanceUserNickname';

  /// Your reach five redirectUrl
  @override
  String get initialRedirectUrl => '';
}

class _SecondDataSet extends DataSet {
  const _SecondDataSet();

  /// Your data set name
  @override
  String get name => 'My Second Instance Data Set';

  /// Your reach five domain
  @override
  String get initialDomain => '';

  /// Your reach five clientId
  @override
  String get initialClientId => '';

  /// Your reach five android scheme
  @override
  String get initialAndroidScheme => '';

  /// Your reach five ios scheme
  @override
  String get initialIosScheme => 'reachfive-$initialClientId://callback';

  /// Your reach five origin
  @override
  String get initialOrigin => '';

  /// Your reach five account email
  @override
  String get initialEmail => 'MySecondInstanceuserEmail@email.com';

  /// Your reach five account password
  @override
  String get initialPassword => 'Super@123Mdp';

  /// Your reach five account family name
  @override
  String get initialFamilyName => 'MySecondInstanceUserFamilyName';

  /// Your reach five account given name
  @override
  String get initialGivenName => 'MySecondInstanceUserGivenName';

  /// Your reach five account middle name
  @override
  String get initialMiddleName => 'MySecondInstanceUserMiddleName';

  /// Your reach five account nickname
  @override
  String get initialNickame => 'MySecondInstanceUserNickname';

  /// Your reach five redirectUrl
  @override
  String get initialRedirectUrl => '';
}

class DataSets {
  // ignore: library_private_types_in_public_api
  static DataSet get firstDataSet => const _FirstDataSet();

  // ignore: library_private_types_in_public_api
  static DataSet get secondDataSet => const _SecondDataSet();

  static List<DataSet> get dataSets => [firstDataSet, secondDataSet];
}
