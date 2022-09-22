// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_fields.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProfileFieldsGenderEnum _$profileFieldsGenderEnum_female =
    const ProfileFieldsGenderEnum._('female');
const ProfileFieldsGenderEnum _$profileFieldsGenderEnum_male =
    const ProfileFieldsGenderEnum._('male');
const ProfileFieldsGenderEnum _$profileFieldsGenderEnum_other =
    const ProfileFieldsGenderEnum._('other');

ProfileFieldsGenderEnum _$profileFieldsGenderEnumValueOf(String name) {
  switch (name) {
    case 'female':
      return _$profileFieldsGenderEnum_female;
    case 'male':
      return _$profileFieldsGenderEnum_male;
    case 'other':
      return _$profileFieldsGenderEnum_other;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ProfileFieldsGenderEnum> _$profileFieldsGenderEnumValues =
    new BuiltSet<ProfileFieldsGenderEnum>(const <ProfileFieldsGenderEnum>[
  _$profileFieldsGenderEnum_female,
  _$profileFieldsGenderEnum_male,
  _$profileFieldsGenderEnum_other,
]);

Serializer<ProfileFieldsGenderEnum> _$profileFieldsGenderEnumSerializer =
    new _$ProfileFieldsGenderEnumSerializer();

class _$ProfileFieldsGenderEnumSerializer
    implements PrimitiveSerializer<ProfileFieldsGenderEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'female': 'female',
    'male': 'male',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'female': 'female',
    'male': 'male',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[ProfileFieldsGenderEnum];
  @override
  final String wireName = 'ProfileFieldsGenderEnum';

  @override
  Object serialize(Serializers serializers, ProfileFieldsGenderEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ProfileFieldsGenderEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProfileFieldsGenderEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ProfileFields extends ProfileFields {
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? externalId;
  @override
  final bool? emailVerified;
  @override
  final bool? phoneNumberVerified;
  @override
  final String? givenName;
  @override
  final String? middleName;
  @override
  final String? familyName;
  @override
  final String? name;
  @override
  final String? nickname;
  @override
  final String? username;
  @override
  final String? birthdate;
  @override
  final ProfileFieldsGenderEnum? gender;
  @override
  final JsonObject? addresses;
  @override
  final String? picture;
  @override
  final String? company;
  @override
  final JsonObject? customFields;
  @override
  final JsonObject? consents;

  factory _$ProfileFields([void Function(ProfileFieldsBuilder)? updates]) =>
      (new ProfileFieldsBuilder()..update(updates))._build();

  _$ProfileFields._(
      {this.email,
      this.phoneNumber,
      this.externalId,
      this.emailVerified,
      this.phoneNumberVerified,
      this.givenName,
      this.middleName,
      this.familyName,
      this.name,
      this.nickname,
      this.username,
      this.birthdate,
      this.gender,
      this.addresses,
      this.picture,
      this.company,
      this.customFields,
      this.consents})
      : super._();

  @override
  ProfileFields rebuild(void Function(ProfileFieldsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileFieldsBuilder toBuilder() => new ProfileFieldsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileFields &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        externalId == other.externalId &&
        emailVerified == other.emailVerified &&
        phoneNumberVerified == other.phoneNumberVerified &&
        givenName == other.givenName &&
        middleName == other.middleName &&
        familyName == other.familyName &&
        name == other.name &&
        nickname == other.nickname &&
        username == other.username &&
        birthdate == other.birthdate &&
        gender == other.gender &&
        addresses == other.addresses &&
        picture == other.picture &&
        company == other.company &&
        customFields == other.customFields &&
        consents == other.consents;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            0,
                                                                            email
                                                                                .hashCode),
                                                                        phoneNumber
                                                                            .hashCode),
                                                                    externalId
                                                                        .hashCode),
                                                                emailVerified
                                                                    .hashCode),
                                                            phoneNumberVerified
                                                                .hashCode),
                                                        givenName.hashCode),
                                                    middleName.hashCode),
                                                familyName.hashCode),
                                            name.hashCode),
                                        nickname.hashCode),
                                    username.hashCode),
                                birthdate.hashCode),
                            gender.hashCode),
                        addresses.hashCode),
                    picture.hashCode),
                company.hashCode),
            customFields.hashCode),
        consents.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProfileFields')
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('externalId', externalId)
          ..add('emailVerified', emailVerified)
          ..add('phoneNumberVerified', phoneNumberVerified)
          ..add('givenName', givenName)
          ..add('middleName', middleName)
          ..add('familyName', familyName)
          ..add('name', name)
          ..add('nickname', nickname)
          ..add('username', username)
          ..add('birthdate', birthdate)
          ..add('gender', gender)
          ..add('addresses', addresses)
          ..add('picture', picture)
          ..add('company', company)
          ..add('customFields', customFields)
          ..add('consents', consents))
        .toString();
  }
}

class ProfileFieldsBuilder
    implements Builder<ProfileFields, ProfileFieldsBuilder> {
  _$ProfileFields? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _externalId;
  String? get externalId => _$this._externalId;
  set externalId(String? externalId) => _$this._externalId = externalId;

  bool? _emailVerified;
  bool? get emailVerified => _$this._emailVerified;
  set emailVerified(bool? emailVerified) =>
      _$this._emailVerified = emailVerified;

  bool? _phoneNumberVerified;
  bool? get phoneNumberVerified => _$this._phoneNumberVerified;
  set phoneNumberVerified(bool? phoneNumberVerified) =>
      _$this._phoneNumberVerified = phoneNumberVerified;

  String? _givenName;
  String? get givenName => _$this._givenName;
  set givenName(String? givenName) => _$this._givenName = givenName;

  String? _middleName;
  String? get middleName => _$this._middleName;
  set middleName(String? middleName) => _$this._middleName = middleName;

  String? _familyName;
  String? get familyName => _$this._familyName;
  set familyName(String? familyName) => _$this._familyName = familyName;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nickname;
  String? get nickname => _$this._nickname;
  set nickname(String? nickname) => _$this._nickname = nickname;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _birthdate;
  String? get birthdate => _$this._birthdate;
  set birthdate(String? birthdate) => _$this._birthdate = birthdate;

  ProfileFieldsGenderEnum? _gender;
  ProfileFieldsGenderEnum? get gender => _$this._gender;
  set gender(ProfileFieldsGenderEnum? gender) => _$this._gender = gender;

  JsonObject? _addresses;
  JsonObject? get addresses => _$this._addresses;
  set addresses(JsonObject? addresses) => _$this._addresses = addresses;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  String? _company;
  String? get company => _$this._company;
  set company(String? company) => _$this._company = company;

  JsonObject? _customFields;
  JsonObject? get customFields => _$this._customFields;
  set customFields(JsonObject? customFields) =>
      _$this._customFields = customFields;

  JsonObject? _consents;
  JsonObject? get consents => _$this._consents;
  set consents(JsonObject? consents) => _$this._consents = consents;

  ProfileFieldsBuilder() {
    ProfileFields._defaults(this);
  }

  ProfileFieldsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _phoneNumber = $v.phoneNumber;
      _externalId = $v.externalId;
      _emailVerified = $v.emailVerified;
      _phoneNumberVerified = $v.phoneNumberVerified;
      _givenName = $v.givenName;
      _middleName = $v.middleName;
      _familyName = $v.familyName;
      _name = $v.name;
      _nickname = $v.nickname;
      _username = $v.username;
      _birthdate = $v.birthdate;
      _gender = $v.gender;
      _addresses = $v.addresses;
      _picture = $v.picture;
      _company = $v.company;
      _customFields = $v.customFields;
      _consents = $v.consents;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileFields other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProfileFields;
  }

  @override
  void update(void Function(ProfileFieldsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProfileFields build() => _build();

  _$ProfileFields _build() {
    final _$result = _$v ??
        new _$ProfileFields._(
            email: email,
            phoneNumber: phoneNumber,
            externalId: externalId,
            emailVerified: emailVerified,
            phoneNumberVerified: phoneNumberVerified,
            givenName: givenName,
            middleName: middleName,
            familyName: familyName,
            name: name,
            nickname: nickname,
            username: username,
            birthdate: birthdate,
            gender: gender,
            addresses: addresses,
            picture: picture,
            company: company,
            customFields: customFields,
            consents: consents);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
