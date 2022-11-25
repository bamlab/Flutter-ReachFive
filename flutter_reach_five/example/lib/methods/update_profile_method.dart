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

  String familyName = '';
  String givenName = '';
  String middleName = '';
  String nickname = '';
  List<MapEntry<String?, Object?>> customFields =
      List.generate(3, (index) => const MapEntry(null, null));

  void setFamilyName(String newFamilyName) => setState(() {
        familyName = newFamilyName;
      });

  void setGivenName(String newGivenName) => setState(() {
        givenName = newGivenName;
      });

  void setMiddleName(String newMiddleName) => setState(() {
        middleName = newMiddleName;
      });

  void setNickname(String newNickname) => setState(() {
        nickname = newNickname;
      });

  void setCustomFieldKeyAtIndex(int index, String newCustomFieldKey) {
    customFields.replaceRange(
      index,
      index + 1,
      [MapEntry(newCustomFieldKey, customFields[index].value)],
    );
  }

  void setCustomFieldValueAtIndex(int index, String newCustomFieldValue) {
    customFields.replaceRange(
      index,
      index + 1,
      [MapEntry(customFields[index].key, newCustomFieldValue)],
    );
  }

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
        profile: Profile(
          familyName: familyName.isNotEmpty ? familyName : null,
          givenName: givenName.isNotEmpty ? givenName : null,
          middleName: middleName.isNotEmpty ? middleName : null,
          nickname: nickname.isNotEmpty ? nickname : null,
          customFields: Map.fromEntries(
            customFields.where((customField) => customField.key != null).map(
                  (entry) => MapEntry<String, Object?>(entry.key!, entry.value),
                ),
          ),
        ),
      );

      setState(() {
        familyName = newProfile.familyName ?? '';
        givenName = newProfile.givenName ?? '';
        middleName = newProfile.middleName ?? '';
        nickname = newProfile.nickname ?? '';
      });

      if (mounted) {
        showExampleSnackBar(
          context,
          message: 'Success - Update Profile - ${widget.dataSet.name}',
          type: SnackbarType.success,
        );
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
    return ListView(
      children: [
        CustomTextField(
          value: familyName,
          hintText: 'familyName',
          setValue: setFamilyName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: givenName,
          hintText: 'givenName',
          setValue: setGivenName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: middleName,
          hintText: 'middleName',
          setValue: setMiddleName,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          value: nickname,
          hintText: 'nickname',
          setValue: setNickname,
        ),
        const SizedBox(height: 32),
        Column(
          children: [
            const Text('Custom Fields', style: TextStyle(fontSize: 18)),
            const Text(
              'keys must be created in the ReachFive console',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            ...customFields.asMap().entries.map<Widget>(
                  (entry) => Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          value: entry.value.key != null
                              ? entry.value.key.toString()
                              : '',
                          hintText: 'Key',
                          setValue: (newKey) =>
                              setCustomFieldKeyAtIndex(entry.key, newKey),
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: CustomTextField(
                          value: entry.value.value != null
                              ? entry.value.value.toString()
                              : '',
                          hintText: 'Value (String only)',
                          setValue: (newValue) =>
                              setCustomFieldValueAtIndex(entry.key, newValue),
                        ),
                      ),
                    ],
                  ),
                )
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
