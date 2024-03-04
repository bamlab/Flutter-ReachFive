# reach_five_identity_repo.api.OAuthApi

## Load the API package
```dart
import 'package:reach_five_identity_repo/api.dart';
```

All URIs are relative to *https://YOUR_DOMAIN*

Method | HTTP request | Description
------------- | ------------- | -------------
[**revokeToken**](OAuthApi.md#revoketoken) | **POST** /oauth/revoke | Revoke a token


# **revokeToken**
> revokeToken(revokeTokenRequest)

Revoke a token

Use this endpoint to invalidate (revoke) a refresh or access token.  - **refresh_token**: When a refresh token is revoked, all the tokens associated with the user and `client_id` are revoked. - **access_token**: When an access token is revoked, only the tokens associated with the same specific grant are revoked. 

### Example
```dart
import 'package:reach_five_identity_repo/api.dart';

final api = ReachFiveIdentityRepo().getOAuthApi();
final RevokeTokenRequest revokeTokenRequest = ; // RevokeTokenRequest | 

try {
    api.revokeToken(revokeTokenRequest);
} catch on DioException (e) {
    print('Exception when calling OAuthApi->revokeToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revokeTokenRequest** | [**RevokeTokenRequest**](RevokeTokenRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

