import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetWeatherCall {
  static Future<ApiCallResponse> call({
    String? cityName = 'Providence',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeather',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/weather?appid=1e86bed9ee2097338fe27b9cadb604f4&units=imperial',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': cityName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallBackCall {
  static Future<ApiCallResponse> call({
    String? authorizationCode = '',
    String? redirect = 'https://spotifycallback-nqeqw2nsyq-uc.a.run.app',
    String? grant = '',
  }) async {
    final ffApiRequestBody = '''
{
  "code": "${escapeStringForJson(authorizationCode)}",
  "redirect_uri": "${escapeStringForJson(redirect)}",
  "grant_type": "${escapeStringForJson(grant)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CallBack',
      apiUrl: 'https://callback-nqeqw2nsyq-uc.a.run.app',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SpotifyCallBackCall {
  static Future<ApiCallResponse> call({
    String? code = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SpotifyCallBack',
      apiUrl: 'https://spotifycallback-nqeqw2nsyq-uc.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'code': code,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SpotifyLogInCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'SpotifyLogIn',
      apiUrl: 'https://api.spotify.com/v1/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ACCESS_TOKEN',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshSpotifyTokenCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'refreshSpotifyToken',
      apiUrl: 'https://refreshaccesstoken-nqeqw2nsyq-uc.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'userId': "authUser.uid",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.accessToken''',
      );
}

class GetRecommendationsCall {
  static Future<ApiCallResponse> call({
    String? genre = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getRecommendations',
      apiUrl: 'https://getrecommendations-nqeqw2nsyq-uc.a.run.app',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'genre': genre,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? list(dynamic response) => getJsonField(
        response,
        r'''$.recommendations''',
        true,
      ) as List?;
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
