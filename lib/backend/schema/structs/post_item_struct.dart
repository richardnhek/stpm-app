// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostItemStruct extends FFFirebaseStruct {
  PostItemStruct({
    String? title,
    String? description,
    String? postOwner,
    DateTime? createdAt,
    int? id,
    List<LikeItemStruct>? likes,
    List<CommentItemStruct>? comments,
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _description = description,
        _postOwner = postOwner,
        _createdAt = createdAt,
        _id = id,
        _likes = likes,
        _comments = comments,
        _content = content,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "post_owner" field.
  String? _postOwner;
  String get postOwner => _postOwner ?? '';
  set postOwner(String? val) => _postOwner = val;

  bool hasPostOwner() => _postOwner != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "likes" field.
  List<LikeItemStruct>? _likes;
  List<LikeItemStruct> get likes => _likes ?? const [];
  set likes(List<LikeItemStruct>? val) => _likes = val;

  void updateLikes(Function(List<LikeItemStruct>) updateFn) {
    updateFn(_likes ??= []);
  }

  bool hasLikes() => _likes != null;

  // "comments" field.
  List<CommentItemStruct>? _comments;
  List<CommentItemStruct> get comments => _comments ?? const [];
  set comments(List<CommentItemStruct>? val) => _comments = val;

  void updateComments(Function(List<CommentItemStruct>) updateFn) {
    updateFn(_comments ??= []);
  }

  bool hasComments() => _comments != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  static PostItemStruct fromMap(Map<String, dynamic> data) => PostItemStruct(
        title: data['title'] as String?,
        description: data['description'] as String?,
        postOwner: data['post_owner'] as String?,
        createdAt: data['created_at'] as DateTime?,
        id: castToType<int>(data['id']),
        likes: getStructList(
          data['likes'],
          LikeItemStruct.fromMap,
        ),
        comments: getStructList(
          data['comments'],
          CommentItemStruct.fromMap,
        ),
        content: data['content'] as String?,
      );

  static PostItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'description': _description,
        'post_owner': _postOwner,
        'created_at': _createdAt,
        'id': _id,
        'likes': _likes?.map((e) => e.toMap()).toList(),
        'comments': _comments?.map((e) => e.toMap()).toList(),
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'post_owner': serializeParam(
          _postOwner,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.DataStruct,
          isList: true,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.DataStruct,
          isList: true,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostItemStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        postOwner: deserializeParam(
          data['post_owner'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        likes: deserializeStructParam<LikeItemStruct>(
          data['likes'],
          ParamType.DataStruct,
          true,
          structBuilder: LikeItemStruct.fromSerializableMap,
        ),
        comments: deserializeStructParam<CommentItemStruct>(
          data['comments'],
          ParamType.DataStruct,
          true,
          structBuilder: CommentItemStruct.fromSerializableMap,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostItemStruct &&
        title == other.title &&
        description == other.description &&
        postOwner == other.postOwner &&
        createdAt == other.createdAt &&
        id == other.id &&
        listEquality.equals(likes, other.likes) &&
        listEquality.equals(comments, other.comments) &&
        content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [title, description, postOwner, createdAt, id, likes, comments, content]);
}

PostItemStruct createPostItemStruct({
  String? title,
  String? description,
  String? postOwner,
  DateTime? createdAt,
  int? id,
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostItemStruct(
      title: title,
      description: description,
      postOwner: postOwner,
      createdAt: createdAt,
      id: id,
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostItemStruct? updatePostItemStruct(
  PostItemStruct? postItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    postItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostItemStructData(
  Map<String, dynamic> firestoreData,
  PostItemStruct? postItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (postItem == null) {
    return;
  }
  if (postItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && postItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postItemData = getPostItemFirestoreData(postItem, forFieldValue);
  final nestedData = postItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = postItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostItemFirestoreData(
  PostItemStruct? postItem, [
  bool forFieldValue = false,
]) {
  if (postItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(postItem.toMap());

  // Add any Firestore field values
  postItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostItemListFirestoreData(
  List<PostItemStruct>? postItems,
) =>
    postItems?.map((e) => getPostItemFirestoreData(e, true)).toList() ?? [];
