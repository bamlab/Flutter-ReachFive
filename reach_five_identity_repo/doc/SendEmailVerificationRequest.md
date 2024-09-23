# reach_five_identity_repo.model.SendEmailVerificationRequest

## Load the model package
```dart
import 'package:reach_five_identity_repo/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**redirectUrl** | **String** | The URL sent in the verification email to which the profile is redirected. This URL must be whitelisted in the `Allowed Callback URLs` field of your ReachFive client settings. | [optional] 
**returnToAfterEmailConfirmation** | **String** | Returned in the `redirect_url` as a query parameter, this parameter is used as the post-email confirmation URL. It must be a valid URL. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


