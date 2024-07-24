import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start STPMAPICallGroup Group Code

class STPMAPICallGroupGroup {
  static String getBaseUrl({
    String? publicKey = '',
  }) =>
      'https://1.demo.hunmanet.kh/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [publicKey]',
  };
  static STPMEventsCall sTPMEventsCall = STPMEventsCall();
  static STPMAnnouncementsCall sTPMAnnouncementsCall = STPMAnnouncementsCall();
  static STPMGetMediaCall sTPMGetMediaCall = STPMGetMediaCall();
  static STPMGetSiteConfigCall sTPMGetSiteConfigCall = STPMGetSiteConfigCall();
}

class STPMEventsCall {
  Future<ApiCallResponse> call({
    String? lang = '',
    int? pageSize,
    String? publicKey = '',
  }) async {
    final baseUrl = STPMAPICallGroupGroup.getBaseUrl(
      publicKey: publicKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'STPMEvents',
      apiUrl:
          '${baseUrl}/events?locale=${lang}&sort=publishedAt:desc&pagination${pageSize}=3&populate=*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${publicKey}',
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

  List<NewsItemStruct>? allEventsData(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => NewsItemStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class STPMAnnouncementsCall {
  Future<ApiCallResponse> call({
    String? lang = '',
    int? pageSize,
    String? publicKey = '',
  }) async {
    final baseUrl = STPMAPICallGroupGroup.getBaseUrl(
      publicKey: publicKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'STPMAnnouncements',
      apiUrl:
          '${baseUrl}/announcements?locale=${lang}&sort=publishedAt:desc&pagination${pageSize}=3&populate=*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${publicKey}',
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

class STPMGetMediaCall {
  Future<ApiCallResponse> call({
    String? filter = 'filters[mime][\$contains]=video/',
    String? publicKey = '',
  }) async {
    final baseUrl = STPMAPICallGroupGroup.getBaseUrl(
      publicKey: publicKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'STPMGetMedia',
      apiUrl: '${baseUrl}/upload/files/?${filter}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${publicKey}',
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

class STPMGetSiteConfigCall {
  Future<ApiCallResponse> call({
    String? publicKey = '',
  }) async {
    final baseUrl = STPMAPICallGroupGroup.getBaseUrl(
      publicKey: publicKey,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'STPMGetSiteConfig',
      apiUrl: '${baseUrl}/site-config',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${publicKey}',
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

/// End STPMAPICallGroup Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
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
