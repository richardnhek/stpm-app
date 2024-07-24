// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikeItemStruct extends FFFirebaseStruct {
  LikeItemStruct({
    int? id,
    DateTime? createdAt,
    int? postId,
    String? whitelistUser,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _createdAt = createdAt,
        _postId = postId,
        _whitelistUser = whitelistUser,
        _userId = userId,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "post_id" field.
  int? _postId;
  int get postId => _postId ?? 0;
  set postId(int? val) => _postId = val;

  void incrementPostId(int amount) => postId = postId + amount;

  bool hasPostId() => _postId != null;

  // "whitelist_user" field.
  String? _whitelistUser;
  String get whitelistUser => _whitelistUser ?? '';
  set whitelistUser(String? val) => _whitelistUser = val;

  bool hasWhitelistUser() => _whitelistUser != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  static LikeItemStruct fromMap(Map<String, dynamic> data) => LikeItemStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        postId: castToType<int>(data['post_id']),
        whitelistUser: data['whitelist_user'] as String?,
        userId: data['user_id'] as String?,
      );

  static LikeItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? LikeItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'post_id': _postId,
        'whitelist_user': _whitelistUser,
        'user_id': _userId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'post_id': serializeParam(
          _postId,
          ParamType.int,
        ),
        'whitelist_user': serializeParam(
          _whitelistUser,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
      }.withoutNulls;

  static LikeItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikeItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        postId: deserializeParam(
          data['post_id'],
          ParamType.int,
          false,
        ),
        whitelistUser: deserializeParam(
          data['whitelist_user'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LikeItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LikeItemStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        postId == other.postId &&
        whitelistUser == other.whitelistUser &&
        userId == other.userId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, createdAt, postId, whitelistUser, userId]);
}

LikeItemStruct createLikeItemStruct({
  int? id,
  DateTime? createdAt,
  int? postId,
  String? whitelistUser,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikeItemStruct(
      id: id,
      createdAt: createdAt,
      postId: postId,
      whitelistUser: whitelistUser,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikeItemStruct? updateLikeItemStruct(
  LikeItemStruct? likeItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    likeItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikeItemStructData(
  Map<String, dynamic> firestoreData,
  LikeItemStruct? likeItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (likeItem == null) {
    return;
  }
  if (likeItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && likeItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likeItemData = getLikeItemFirestoreData(likeItem, forFieldValue);
  final nestedData = likeItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = likeItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikeItemFirestoreData(
  LikeItemStruct? likeItem, [
  bool forFieldValue = false,
]) {
  if (likeItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(likeItem.toMap());

  // Add any Firestore field values
  likeItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikeItemListFirestoreData(
  List<LikeItemStruct>? likeItems,
) =>
    likeItems?.map((e) => getLikeItemFirestoreData(e, true)).toList() ?? [];
