// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentItemStruct extends FFFirebaseStruct {
  CommentItemStruct({
    int? id,
    DateTime? createdAt,
    int? postId,
    String? content,
    String? whitelistUser,
    String? userId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _createdAt = createdAt,
        _postId = postId,
        _content = content,
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

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

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

  static CommentItemStruct fromMap(Map<String, dynamic> data) =>
      CommentItemStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        postId: castToType<int>(data['post_id']),
        content: data['content'] as String?,
        whitelistUser: data['whitelist_user'] as String?,
        userId: data['user_id'] as String?,
      );

  static CommentItemStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'post_id': _postId,
        'content': _content,
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
        'content': serializeParam(
          _content,
          ParamType.String,
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

  static CommentItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentItemStruct(
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
        content: deserializeParam(
          data['content'],
          ParamType.String,
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
  String toString() => 'CommentItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentItemStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        postId == other.postId &&
        content == other.content &&
        whitelistUser == other.whitelistUser &&
        userId == other.userId;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, createdAt, postId, content, whitelistUser, userId]);
}

CommentItemStruct createCommentItemStruct({
  int? id,
  DateTime? createdAt,
  int? postId,
  String? content,
  String? whitelistUser,
  String? userId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentItemStruct(
      id: id,
      createdAt: createdAt,
      postId: postId,
      content: content,
      whitelistUser: whitelistUser,
      userId: userId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentItemStruct? updateCommentItemStruct(
  CommentItemStruct? commentItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commentItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentItemStructData(
  Map<String, dynamic> firestoreData,
  CommentItemStruct? commentItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commentItem == null) {
    return;
  }
  if (commentItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commentItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentItemData =
      getCommentItemFirestoreData(commentItem, forFieldValue);
  final nestedData =
      commentItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commentItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentItemFirestoreData(
  CommentItemStruct? commentItem, [
  bool forFieldValue = false,
]) {
  if (commentItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commentItem.toMap());

  // Add any Firestore field values
  commentItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentItemListFirestoreData(
  List<CommentItemStruct>? commentItems,
) =>
    commentItems?.map((e) => getCommentItemFirestoreData(e, true)).toList() ??
    [];
