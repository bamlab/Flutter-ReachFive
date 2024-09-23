//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:reach_five_identity_repo/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:reach_five_identity_repo/src/model/send_email_verification200_response.dart';
import 'package:reach_five_identity_repo/src/model/send_email_verification_request.dart';

class EmailApi {
  final Dio _dio;

  const EmailApi(this._dio);

  /// Request verification of the email address
  /// Request the verification of the email address of a profile. If there is an email address configured in the profile that was not already verified, sends an email to verify it.
  ///
  /// Parameters:
  /// * [authorization] - Bearer `{token}` for a valid OAuth token.
  /// * [trueClientIP] - An optional header field; IP to protect requests from the backend.  **Note**: For more details, see [Identity Fraud Protection](https://developer.reachfive.com/docs/ifp.html#enable-true-client-ip-key).
  /// * [trueClientIPKey] - An optional header field; the secret that must match the True-Client-IP-Key generated in the ReachFive console.  **Note**: For more details, see [Identity Fraud Protection](https://developer.reachfive.com/docs/ifp.html#enable-true-client-ip-key).
  /// * [sendEmailVerificationRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extra] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SendEmailVerification200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SendEmailVerification200Response>> sendEmailVerification({
    required String authorization,
    String? trueClientIP,
    String? trueClientIPKey,
    SendEmailVerificationRequest? sendEmailVerificationRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/identity/v1/send-email-verification';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        r'Authorization': authorization,
        if (trueClientIP != null) r'True-Client-IP': trueClientIP,
        if (trueClientIPKey != null) r'True-Client-IP-Key': trueClientIPKey,
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(sendEmailVerificationRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SendEmailVerification200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<SendEmailVerification200Response,
                  SendEmailVerification200Response>(
              rawData, 'SendEmailVerification200Response',
              growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SendEmailVerification200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }
}
