import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';

import 'package:ff_commons/api_requests/api_paging_params.dart';

export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Spotify Account API Group Code

class SpotifyAccountAPIGroup {
  static String getBaseUrl() => 'https://accounts.spotify.com/';
  static Map<String, String> headers = {
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  static AccessRefreshTokenCall accessRefreshTokenCall =
      AccessRefreshTokenCall();
  static AccessTokenCall accessTokenCall = AccessTokenCall();
}

class AccessRefreshTokenCall {
  Future<ApiCallResponse> call({
    String? base64 = '',
    String? code = '',
    String? redirect,
  }) async {
    redirect ??= FFLibraryValues().redirectUrlMobile;
    final baseUrl = SpotifyAccountAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Access Refresh Token',
      apiUrl: '${baseUrl}api/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ${base64}',
      },
      params: {
        'grant_type': "authorization_code",
        'code': code,
        'redirect_uri': redirect,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AccessTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
    String? base64 = '',
  }) async {
    final baseUrl = SpotifyAccountAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Access Token',
      apiUrl: '${baseUrl}api/token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Basic ${base64}',
      },
      params: {
        'grant_type': "refresh_token",
        'refresh_token': refreshToken,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Spotify Account API Group Code

/// Start Spotify API Group Code

class SpotifyAPIGroup {
  static String getBaseUrl() => 'https://api.spotify.com/';
  static Map<String, String> headers = {};
  static RecentlyPlayedTracksCall recentlyPlayedTracksCall =
      RecentlyPlayedTracksCall();
}

class RecentlyPlayedTracksCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = SpotifyAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Recently played tracks',
      apiUrl: '${baseUrl}v1/me/player/recently-played',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
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

/// End Spotify API Group Code

String _toEncodable(dynamic item) {
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
