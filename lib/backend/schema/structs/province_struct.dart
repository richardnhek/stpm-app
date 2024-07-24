// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinceStruct extends FFFirebaseStruct {
  ProvinceStruct({
    ProvinceDataStruct? data,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        super(firestoreUtilData);

  // "data" field.
  ProvinceDataStruct? _data;
  ProvinceDataStruct get data => _data ?? ProvinceDataStruct();
  set data(ProvinceDataStruct? val) => _data = val;

  void updateData(Function(ProvinceDataStruct) updateFn) {
    updateFn(_data ??= ProvinceDataStruct());
  }

  bool hasData() => _data != null;

  static ProvinceStruct fromMap(Map<String, dynamic> data) => ProvinceStruct(
        data: ProvinceDataStruct.maybeFromMap(data['data']),
      );

  static ProvinceStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProvinceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ProvinceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProvinceStruct(
        data: deserializeStructParam(
          data['data'],
          ParamType.DataStruct,
          false,
          structBuilder: ProvinceDataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProvinceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProvinceStruct && data == other.data;
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

ProvinceStruct createProvinceStruct({
  ProvinceDataStruct? data,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProvinceStruct(
      data: data ?? (clearUnsetFields ? ProvinceDataStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProvinceStruct? updateProvinceStruct(
  ProvinceStruct? province, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    province
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProvinceStructData(
  Map<String, dynamic> firestoreData,
  ProvinceStruct? province,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (province == null) {
    return;
  }
  if (province.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && province.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final provinceData = getProvinceFirestoreData(province, forFieldValue);
  final nestedData = provinceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = province.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProvinceFirestoreData(
  ProvinceStruct? province, [
  bool forFieldValue = false,
]) {
  if (province == null) {
    return {};
  }
  final firestoreData = mapToFirestore(province.toMap());

  // Handle nested data for "data" field.
  addProvinceDataStructData(
    firestoreData,
    province.hasData() ? province.data : null,
    'data',
    forFieldValue,
  );

  // Add any Firestore field values
  province.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProvinceListFirestoreData(
  List<ProvinceStruct>? provinces,
) =>
    provinces?.map((e) => getProvinceFirestoreData(e, true)).toList() ?? [];
