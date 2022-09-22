# reach_five_repo.api.MFAApi

## Load the API package
```dart
import 'package:reach_five_repo/api.dart';
```

All URIs are relative to *https://YOUR_DOMAIN*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteEmailCredential**](MFAApi.md#deleteemailcredential) | **DELETE** /identity/v1/mfa/credentials/emails | Delete an MFA credential (email)
[**deletePhoneNumberCredential**](MFAApi.md#deletephonenumbercredential) | **DELETE** /identity/v1/mfa/credentials/phone-numbers | Delete an MFA credential (phone number)


# **deleteEmailCredential**
> deleteEmailCredential(authorization)

Delete an MFA credential (email)

Delete the email that has been added as an MFA credential (second factor).  > **Note**: You must have a fresh access token (issued in the last 5 minutes) to use this endpoint.  > **Stepup**: The access token must contain the `mfa` `amr` if you want to delete the credential. This means you need to do a [stepup operation](#operation/stepup) before you can delete the credential.  

### Example
```dart
import 'package:reach_five_repo/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2
//defaultApiClient.getAuthentication<OAuth>('OAuth2').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure OAuth2 access token for authorization: OAuth2
//defaultApiClient.getAuthentication<OAuth>('OAuth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ReachFiveRepo().getMFAApi();
final String authorization = authorization_example; // String | Bearer `{token}` for a valid OAuth token.

try {
    api.deleteEmailCredential(authorization);
} catch on DioError (e) {
    print('Exception when calling MFAApi->deleteEmailCredential: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Bearer `{token}` for a valid OAuth token. | 

### Return type

void (empty response body)

### Authorization

[OAuth2](../README.md#OAuth2), [OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deletePhoneNumberCredential**
> deletePhoneNumberCredential(authorization, deletePhoneNumberCredentialRequest)

Delete an MFA credential (phone number)

Delete the phone number that has been added as an MFA credential (second factor).  **Note**: You must have a fresh access token (issued in the last 5 minutes) to use this endpoint. 

### Example
```dart
import 'package:reach_five_repo/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2
//defaultApiClient.getAuthentication<OAuth>('OAuth2').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure OAuth2 access token for authorization: OAuth2
//defaultApiClient.getAuthentication<OAuth>('OAuth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ReachFiveRepo().getMFAApi();
final String authorization = authorization_example; // String | Bearer `{token}` for a valid OAuth token.
final DeletePhoneNumberCredentialRequest deletePhoneNumberCredentialRequest = ; // DeletePhoneNumberCredentialRequest | 

try {
    api.deletePhoneNumberCredential(authorization, deletePhoneNumberCredentialRequest);
} catch on DioError (e) {
    print('Exception when calling MFAApi->deletePhoneNumberCredential: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Bearer `{token}` for a valid OAuth token. | 
 **deletePhoneNumberCredentialRequest** | [**DeletePhoneNumberCredentialRequest**](DeletePhoneNumberCredentialRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[OAuth2](../README.md#OAuth2), [OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

