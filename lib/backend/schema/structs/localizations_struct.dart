// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocalizationsStruct extends FFFirebaseStruct {
  LocalizationsStruct({
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

  static LocalizationsStruct fromMap(Map<String, dynamic> data) =>
      LocalizationsStruct(
        data: getStructList(
          data['data'],
          DataStruct.fromMap,
        ),
      );

  static LocalizationsStruct? maybeFromMap(dynamic data) => data is Map
      ? LocalizationsStruct.fromMap(data.cast<String, dynamic>())
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

  static LocalizationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocalizationsStruct(
        data: deserializeStructParam<DataStruct>(
          data['data'],
          ParamType.DataStruct,
          true,
          structBuilder: DataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LocalizationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LocalizationsStruct &&
        listEquality.equals(data, other.data);
  }

  @override
  int get hashCode => const ListEquality().hash([data]);
}

LocalizationsStruct createLocalizationsStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocalizationsStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocalizationsStruct? updateLocalizationsStruct(
  LocalizationsStruct? localizations, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    localizations
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocalizationsStructData(
  Map<String, dynamic> firestoreData,
  LocalizationsStruct? localizations,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (localizations == null) {
    return;
  }
  if (localizations.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && localizations.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final localizationsData =
      getLocalizationsFirestoreData(localizations, forFieldValue);
  final nestedData =
      localizationsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = localizations.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocalizationsFirestoreData(
  LocalizationsStruct? localizations, [
  bool forFieldValue = false,
]) {
  if (localizations == null) {
    return {};
  }
  final firestoreData = mapToFirestore(localizations.toMap());

  // Add any Firestore field values
  localizations.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocalizationsListFirestoreData(
  List<LocalizationsStruct>? localizationss,
) =>
    localizationss
        ?.map((e) => getLocalizationsFirestoreData(e, true))
        .toList() ??
    [];
