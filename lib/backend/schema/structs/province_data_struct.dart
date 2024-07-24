// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinceDataStruct extends FFFirebaseStruct {
  ProvinceDataStruct({
    int? id,
    ProvinceAttributesStruct? attributes,
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
  ProvinceAttributesStruct? _attributes;
  ProvinceAttributesStruct get attributes =>
      _attributes ?? ProvinceAttributesStruct();
  set attributes(ProvinceAttributesStruct? val) => _attributes = val;

  void updateAttributes(Function(ProvinceAttributesStruct) updateFn) {
    updateFn(_attributes ??= ProvinceAttributesStruct());
  }

  bool hasAttributes() => _attributes != null;

  static ProvinceDataStruct fromMap(Map<String, dynamic> data) =>
      ProvinceDataStruct(
        id: castToType<int>(data['id']),
        attributes: ProvinceAttributesStruct.maybeFromMap(data['attributes']),
      );

  static ProvinceDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProvinceDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static ProvinceDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProvinceDataStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        attributes: deserializeStructParam(
          data['attributes'],
          ParamType.DataStruct,
          false,
          structBuilder: ProvinceAttributesStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProvinceDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProvinceDataStruct &&
        id == other.id &&
        attributes == other.attributes;
  }

  @override
  int get hashCode => const ListEquality().hash([id, attributes]);
}

ProvinceDataStruct createProvinceDataStruct({
  int? id,
  ProvinceAttributesStruct? attributes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProvinceDataStruct(
      id: id,
      attributes:
          attributes ?? (clearUnsetFields ? ProvinceAttributesStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProvinceDataStruct? updateProvinceDataStruct(
  ProvinceDataStruct? provinceData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    provinceData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProvinceDataStructData(
  Map<String, dynamic> firestoreData,
  ProvinceDataStruct? provinceData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (provinceData == null) {
    return;
  }
  if (provinceData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && provinceData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final provinceDataData =
      getProvinceDataFirestoreData(provinceData, forFieldValue);
  final nestedData =
      provinceDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = provinceData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProvinceDataFirestoreData(
  ProvinceDataStruct? provinceData, [
  bool forFieldValue = false,
]) {
  if (provinceData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(provinceData.toMap());

  // Handle nested data for "attributes" field.
  addProvinceAttributesStructData(
    firestoreData,
    provinceData.hasAttributes() ? provinceData.attributes : null,
    'attributes',
    forFieldValue,
  );

  // Add any Firestore field values
  provinceData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProvinceDataListFirestoreData(
  List<ProvinceDataStruct>? provinceDatas,
) =>
    provinceDatas?.map((e) => getProvinceDataFirestoreData(e, true)).toList() ??
    [];
