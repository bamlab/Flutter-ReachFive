# reach_five_repo.api.FIDO2Api

## Load the API package
```dart
import 'package:reach_five_repo/api.dart';
```

All URIs are relative to *https://YOUR_DOMAIN*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteCredential**](FIDO2Api.md#deletecredential) | **DELETE** /identity/v1/webauthn/registration/{id} | Delete a credential of a user


# **deleteCredential**
> deleteCredential(authorization, id)

Delete a credential of a user

Delete a specific user's registered crendential.  **Note**: The access token must have been generated in the **last 5 minutes**,. The authentication token will contain the ReachFive client ID and the user's identifier.  **Warning**: The WebAuthn feature must be activated for your ReachFive account. 

### Example
```dart
import 'package:reach_five_repo/api.dart';
// TODO Configure OAuth2 access token for authorization: OAuth2
//defaultApiClient.getAuthentication<OAuth>('OAuth2').accessToken = 'YOUR_ACCESS_TOKEN';
// TODO Configure OAuth2 access token for authorization: OAuth2
//defaultApiClient.getAuthentication<OAuth>('OAuth2').accessToken = 'YOUR_ACCESS_TOKEN';

final api = ReachFiveRepo().getFIDO2Api();
final String authorization = authorization_example; // String | Bearer `{token}` for a valid OAuth token.
final String id = AValy7JUf5YjmYBdgP_xv5ZNJfyy0MNz8gHDJI6jQfqONDVfTza7Eq-ICNk6vcBKVT2NOavKTMRSiTjduwN7dAs_EcF3j9Zadb5EIBYq3KZgUw==; // String | The identifier of the credential.

try {
    api.deleteCredential(authorization, id);
} catch on DioError (e) {
    print('Exception when calling FIDO2Api->deleteCredential: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Bearer `{token}` for a valid OAuth token. | 
 **id** | **String**| The identifier of the credential. | 

### Return type

void (empty response body)

### Authorization

[OAuth2](../README.md#OAuth2), [OAuth2](../README.md#OAuth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

