// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsItemStruct extends FFFirebaseStruct {
  NewsItemStruct({
    int? id,
    AttributesStruct? attributes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _attributes = attributes,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "attributes" field.
  AttributesStruct? _attributes;
  AttributesStruct get attributes => _attributes ?? AttributesStruct();
  set attributes(AttributesStruct? val) => _attributes = val;

  void updateAttributes(Function(AttributesStruct) updateFn) {
    updateFn(_attributes ??= AttributesStruct());
  }

  bool hasAttributes() => _attributes != null;

  static NewsItemStruct fromMap(Map<String, dynamic> data) => NewsItemStruct(
        id: castToType<int>(data['id']),
        attributes: AttributesStruct.maybeFromMap(data['attributes']),
      );

  static NewsItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'attributes': _attributes?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'attributes': serializeParam(
          _attributes,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static NewsItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsItemStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        attributes: deserializeStructParam(
          data['attributes'],
          ParamType.DataStruct,
          false,
          structBuilder: AttributesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'NewsItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsItemStruct &&
        id == other.id &&
        attributes == other.attributes;
  }

  @override
  int get hashCode => const ListEquality().hash([id, attributes]);
}

NewsItemStruct createNewsItemStruct({
  int? id,
  AttributesStruct? attributes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewsItemStruct(
      id: id,
      attributes: attributes ?? (clearUnsetFields ? AttributesStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewsItemStruct? updateNewsItemStruct(
  NewsItemStruct? newsItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newsItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewsItemStructData(
  Map<String, dynamic> firestoreData,
  NewsItemStruct? newsItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newsItem == null) {
    return;
  }
  if (newsItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newsItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newsItemData = getNewsItemFirestoreData(newsItem, forFieldValue);
  final nestedData = newsItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newsItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewsItemFirestoreData(
  NewsItemStruct? newsItem, [
  bool forFieldValue = false,
]) {
  if (newsItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newsItem.toMap());

  // Handle nested data for "attributes" field.
  addAttributesStructData(
    firestoreData,
    newsItem.hasAttributes() ? newsItem.attributes : null,
    'attributes',
    forFieldValue,
  );

  // Add any Firestore field values
  newsItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewsItemListFirestoreData(
  List<NewsItemStruct>? newsItems,
) =>
    newsItems?.map((e) => getNewsItemFirestoreData(e, true)).toList() ?? [];
