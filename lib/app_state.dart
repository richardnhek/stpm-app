import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _publicKey = await secureStorage.getString('ff_publicKey') ?? _publicKey;
    });
    await _safeInitAsync(() async {
      _isWhiteListUser =
          await secureStorage.getBool('ff_isWhiteListUser') ?? _isWhiteListUser;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _publicKey =
      '338fceba2a8873a4adc572f7b00042be7c6b5ee155bccf0a741b91d76091a37c24dd43cf3dc789f84050f21dcb4335a0ac0294b40bfd42ab516a64115593973ca110c0c9a886a16779111a0e927b95f1317b5758d953d253b8fe7a3786785a473b0d0a096620b02efca55bc723b6fd8fd3df661b19ed20c57fddf735e9b87b49';
  String get publicKey => _publicKey;
  set publicKey(String value) {
    _publicKey = value;
    secureStorage.setString('ff_publicKey', value);
  }

  void deletePublicKey() {
    secureStorage.delete(key: 'ff_publicKey');
  }

  bool _isWhiteListUser = false;
  bool get isWhiteListUser => _isWhiteListUser;
  set isWhiteListUser(bool value) {
    _isWhiteListUser = value;
    secureStorage.setBool('ff_isWhiteListUser', value);
  }

  void deleteIsWhiteListUser() {
    secureStorage.delete(key: 'ff_isWhiteListUser');
  }

  String _thisUserUid = '';
  String get thisUserUid => _thisUserUid;
  set thisUserUid(String value) {
    _thisUserUid = value;
  }

  bool _isInitialAppLoad = false;
  bool get isInitialAppLoad => _isInitialAppLoad;
  set isInitialAppLoad(bool value) {
    _isInitialAppLoad = value;
  }

  final _allVideosManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allVideos({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allVideosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllVideosCache() => _allVideosManager.clear();
  void clearAllVideosCacheKey(String? uniqueKey) =>
      _allVideosManager.clearRequest(uniqueKey);

  final _allFeedsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allFeeds({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allFeedsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllFeedsCache() => _allFeedsManager.clear();
  void clearAllFeedsCacheKey(String? uniqueKey) =>
      _allFeedsManager.clearRequest(uniqueKey);

  final _allAnnouncementsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allAnnouncements({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allAnnouncementsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllAnnouncementsCache() => _allAnnouncementsManager.clear();
  void clearAllAnnouncementsCacheKey(String? uniqueKey) =>
      _allAnnouncementsManager.clearRequest(uniqueKey);

  final _allPhotosManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> allPhotos({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _allPhotosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllPhotosCache() => _allPhotosManager.clear();
  void clearAllPhotosCacheKey(String? uniqueKey) =>
      _allPhotosManager.clearRequest(uniqueKey);

  final _liveStreamVideoQueryManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> liveStreamVideoQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _liveStreamVideoQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLiveStreamVideoQueryCache() => _liveStreamVideoQueryManager.clear();
  void clearLiveStreamVideoQueryCacheKey(String? uniqueKey) =>
      _liveStreamVideoQueryManager.clearRequest(uniqueKey);

  final _allPostsQueryCacheManager = FutureRequestManager<List<PostsRow>>();
  Future<List<PostsRow>> allPostsQueryCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PostsRow>> Function() requestFn,
  }) =>
      _allPostsQueryCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAllPostsQueryCacheCache() => _allPostsQueryCacheManager.clear();
  void clearAllPostsQueryCacheCacheKey(String? uniqueKey) =>
      _allPostsQueryCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
