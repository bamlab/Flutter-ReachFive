import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reach_five/flutter_reach_five.dart';

import '../const.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar.dart';

class UpdateProfileMethod extends StatefulWidget {
  const UpdateProfileMethod({
    required this.dataSet,
    required this.reachFive,
    required this.authToken,
    super.key,
  });

  final DataSet dataSet;
  final ReachFive reachFive;
  final AuthToken authToken;

  @override
  State<UpdateProfileMethod> createState() => UpdateProfileMethodState();
}

class UpdateProfileMethodState extends State<UpdateProfileMethod> {
  bool areInteractionsDisabled = false;

  bool isLoading = true;

  late Profile _profile;
  MapEntry<String?, Object?> _newCustomField = const MapEntry(null, null);
  final consentSupportedKey = 'test_consent';

  Future<void> _loadProfile() async {
    setState(() {
      isLoading = true;
    });
    _profile = await widget.reachFive.getProfile(authToken: widget.authToken);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    // ignore: discarded_futures
    _loadProfile();
    super.didChangeDependencies();
  }

  Future<void> _refresh() async {
    setState(() {
      _newCustomField = const MapEntry(null, null);
    });
  }

  void setFamilyName(String newFamilyName) => setState(() {
        _profile = _profile.copyWith(
          familyName: newFamilyName,
        );
      });

  void setGivenName(String newGivenName) => setState(() {
        _profile = _profile.copyWith(
          givenName: newGivenName,
        );
      });

  void setMiddleName(String newMiddleName) => setState(() {
        _profile = _profile.copyWith(
          middleName: newMiddleName,
        );
      });

  void setNickname(String newNickname) => setState(() {
        _profile = _profile.copyWith(
          nickname: newNickname,
        );
      });

  bool? _convertConsentToBool(Consent? consent) {
    if (consent == null) {
      return null;
    }
    if (consent.granted) {
      return true;
    }
    return false;
  }

  void setConsent({required bool? consentGranted}) => setState(() {
        _profile = _profile.copyWith(
          consents: {
            if (consentGranted != null)
              consentSupportedKey: Consent(
                date: DateTime.now(),
                granted: consentGranted,
              )
          },
        );
      });

  static Map<String, Object?> _updateCustomFields({
    required MapEntry<String, Object?> newCustomField,
    Map<String, Object?> customFields = const <String, Object?>{},
  }) {
    final newCustomFields = Map<String, Object?>.of(customFields)
      ..addAll({newCustomField.key: newCustomField.value});
    return newCustomFields;
  }

  void setCustomField(MapEntry<String, Object?> customField) {
    _profile = _profile.copyWith(
      customFields: _updateCustomFields(
        customFields: _profile.customFields ?? {},
        newCustomField: customField,
      ),
    );
  }

  void setNewCustomFieldKey(String newKey) => setState(() {
        _newCustomField = MapEntry(newKey, _newCustomField.value);
      });

  void setNewCustomFieldValue(Object? newValue) => setState(() {
        _newCustomField = MapEntry(_newCustomField.key, newValue);
      });

  Future<void> updateProfile(
    ReachFive reachFive,
    AuthToken authToken,
  ) async {
    setState(() {
      areInteractionsDisabled = true;
    });

    try {
      final newProfile = await reachFive.updateProfile(
        authToken: authToken,
        profile: _profile.copyWith(
          customFields: _newCustomField.key != null
              ? _updateCustomFields(
                  customFields: _profile.customFields ?? {},
                  newCustomField: MapEntry<String, Object?>(
                    _newCustomField.key!,
                    _newCustomField.value,
                  ),
                )
              : _profile.customFields,
        ),
      );

      setState(() {
        _profile = newProfile;
      });

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Update Profile - ${widget.dataSet.name}',
          type: SnackbarType.success,
        );
        await _refresh();
      }
    } catch (error) {
      if (mounted) {
        showExampleSnackBar(
          context,
          message: error.toString(),
          type: SnackbarType.error,
        );
      }
    } finally {
      setState(() {
        areInteractionsDisabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    return ListView(
      children: [
        CustomTextField(
          value: _profile.familyName ?? '',
          hintText: 'familyName',
          setValue: setFamilyName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: _profile.givenName ?? '',
          hintText: 'givenName',
          setValue: setGivenName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: _profile.middleName ?? '',
          hintText: 'middleName',
          setValue: setMiddleName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: _profile.nickname ?? '',
          hintText: 'nickname',
          setValue: setNickname,
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Consent ($consentSupportedKey): ${_profile.consents == null ? '(NEVER GIVEN)' : ''}',
                  ),
                ),
                Checkbox(
                  tristate: true,
                  value: _convertConsentToBool(
                    _profile.consents?[consentSupportedKey],
                  ),
                  onChanged: (value) => setConsent(consentGranted: value),
                ),
              ],
            ),
            const Text(
              '"test_consent" Consent must be created in the ReachFive console',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            const Text('Custom Fields', style: TextStyle(fontSize: 18)),
            if (_profile.customFields != null)
              ..._profile.customFields!.entries.map<Widget>(
                (entry) => Row(
                  children: [
                    Expanded(child: Text('${entry.key} :')),
                    Expanded(
                      child: CustomTextField(
                        value: entry.value.toString(),
                        hintText: 'Value (String only)',
                        setValue: (newValue) =>
                            setCustomField(MapEntry(entry.key, newValue)),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            const Text(
              'New Custom Fields',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'keys must be created in the ReachFive console',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    value: _newCustomField.key != null
                        ? _newCustomField.key.toString()
                        : '',
                    hintText: 'Key',
                    setValue: setNewCustomFieldKey,
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: CustomTextField(
                    value: _newCustomField.value != null
                        ? _newCustomField.value.toString()
                        : '',
                    hintText: 'Value (String only)',
                    setValue: setNewCustomFieldValue,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: !areInteractionsDisabled
              ? () async => updateProfile(widget.reachFive, widget.authToken)
              : null,
          child: const Text('update Profile'),
        ),
      ],
    );
  }
}
