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
