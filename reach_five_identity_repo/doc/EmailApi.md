# reach_five_identity_repo.api.EmailApi

## Load the API package
```dart
import 'package:reach_five_identity_repo/api.dart';
```

All URIs are relative to *https://YOUR_DOMAIN*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sendEmailVerification**](EmailApi.md#sendemailverification) | **POST** /identity/v1/send-email-verification | Request verification of the email address


# **sendEmailVerification**
> SendEmailVerification200Response sendEmailVerification(authorization, trueClientIP, trueClientIPKey, customLocale, sendEmailVerificationRequest)

Request verification of the email address

Request the verification of the email address of a profile. If there is an email address configured in the profile that was not already verified, sends an email to verify it. 

### Example
```dart
import 'package:reach_five_identity_repo/api.dart';

final api = ReachFiveIdentityRepo().getEmailApi();
final String authorization = authorization_example; // String | Bearer `{token}` for a valid OAuth token.
final String trueClientIP = 224.136.62.167; // String | An optional header field; IP to protect requests from the backend.  **Note**: For more details, see [Identity Fraud Protection](https://developer.reachfive.com/docs/ifp.html#enable-true-client-ip-key). 
final String trueClientIPKey = Isdaf03#@Rasdfj!j3jkl; // String | An optional header field; the secret that must match the True-Client-IP-Key generated in the ReachFive console.  **Note**: For more details, see [Identity Fraud Protection](https://developer.reachfive.com/docs/ifp.html#enable-true-client-ip-key). 
final String customLocale = fr-FR; // String | For any endpoint in this specification that generates an email or SMS, you can pass the Custom-Locale attribute as a header parameter. 
final SendEmailVerificationRequest sendEmailVerificationRequest = ; // SendEmailVerificationRequest | 

try {
    final response = api.sendEmailVerification(authorization, trueClientIP, trueClientIPKey, customLocale, sendEmailVerificationRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmailApi->sendEmailVerification: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authorization** | **String**| Bearer `{token}` for a valid OAuth token. | 
 **trueClientIP** | **String**| An optional header field; IP to protect requests from the backend.  **Note**: For more details, see [Identity Fraud Protection](https://developer.reachfive.com/docs/ifp.html#enable-true-client-ip-key).  | [optional] 
 **trueClientIPKey** | **String**| An optional header field; the secret that must match the True-Client-IP-Key generated in the ReachFive console.  **Note**: For more details, see [Identity Fraud Protection](https://developer.reachfive.com/docs/ifp.html#enable-true-client-ip-key).  | [optional] 
 **customLocale** | **String**| For any endpoint in this specification that generates an email or SMS, you can pass the Custom-Locale attribute as a header parameter.  | [optional] 
 **sendEmailVerificationRequest** | [**SendEmailVerificationRequest**](SendEmailVerificationRequest.md)|  | [optional] 

### Return type

[**SendEmailVerification200Response**](SendEmailVerification200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

