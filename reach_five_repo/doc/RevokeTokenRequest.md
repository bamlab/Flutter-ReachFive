# reach_five_repo.model.RevokeTokenRequest

## Load the model package
```dart
import 'package:reach_five_repo/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**clientId** | **String** | Your client ID. | 
**clientSecret** | **String** | Your client Secret. Required if your Client's authorization method is POST. | 
**token** | **String** | The Token to revoke.  > **Note**: This can be either an `access_token` or a `refresh_token`.  | 
**tokenTypeHint** | **String** | An optional string where you can hint at what type of token to differentiate between access and refresh.  > **Note**: The only meaningful values are `access_token` and `refresh_token`.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


