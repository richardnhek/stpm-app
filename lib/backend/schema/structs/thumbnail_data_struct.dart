// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThumbnailDataStruct extends FFFirebaseStruct {
  ThumbnailDataStruct({
    List<DataStruct>? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  List<DataStruct>? _data;
  List<DataStruct> get data => _data ?? const [];
  set data(List<DataStruct>? val) => _data = val;

  void updateData(Function(List<DataStruct>) updateFn) {
    updateFn(_data ??= []);
  }

  bool hasData() => _data != null;

  static ThumbnailDataStruct fromMap(Map<String, dynamic> data) =>
      ThumbnailDataStruct(
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static ThumbnailDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ThumbnailDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static ThumbnailDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThumbnailDataStruct(
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ThumbnailDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThumbnailDataStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ThumbnailDataStruct createThumbnailDataStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThumbnailDataStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThumbnailDataStruct? updateThumbnailDataStruct(
  ThumbnailDataStruct? thumbnailData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thumbnailData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThumbnailDataStructData(
  Map<String, dynamic> firestoreData,
  ThumbnailDataStruct? thumbnailData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thumbnailData == null) {
    return;
  }
  if (thumbnailData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && thumbnailData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thumbnailDataData =
      getThumbnailDataFirestoreData(thumbnailData, forFieldValue);
  final nestedData =
      thumbnailDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = thumbnailData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThumbnailDataFirestoreData(
  ThumbnailDataStruct? thumbnailData, [
  bool forFieldValue = false,
]) {
  if (thumbnailData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thumbnailData.toMap());

  // Add any Firestore field values
  thumbnailData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThumbnailDataListFirestoreData(
  List<ThumbnailDataStruct>? thumbnailDatas,
) =>
    thumbnailDatas
        ?.map((e) => getThumbnailDataFirestoreData(e, true))
        .toList() ??
    [];
