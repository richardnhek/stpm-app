// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProvinceAttributesStruct extends FFFirebaseStruct {
  ProvinceAttributesStruct({
    String? createdAt,
    String? updatedAt,
    String? publishedAt,
    String? locale,
    String? key,
    String? province,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdAt = createdAt,
        _updatedAt = updatedAt,
        _publishedAt = publishedAt,
        _locale = locale,
        _key = key,
        _province = province,
        super(firestoreUtilData);

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "updatedAt" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;

  bool hasUpdatedAt() => _updatedAt != null;

  // "publishedAt" field.
  String? _publishedAt;
  String get publishedAt => _publishedAt ?? '';
  set publishedAt(String? val) => _publishedAt = val;

  bool hasPublishedAt() => _publishedAt != null;

  // "locale" field.
  String? _locale;
  String get locale => _locale ?? '';
  set locale(String? val) => _locale = val;

  bool hasLocale() => _locale != null;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "Province" field.
  String? _province;
  String get province => _province ?? '';
  set province(String? val) => _province = val;

  bool hasProvince() => _province != null;

  static ProvinceAttributesStruct fromMap(Map<String, dynamic> data) =>
      ProvinceAttributesStruct(
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        publishedAt: data['publishedAt'] as String?,
        locale: data['locale'] as String?,
        key: data['key'] as String?,
        province: data['Province'] as String?,
      );

  static ProvinceAttributesStruct? maybeFromMap(dynamic data) => data is Map
      ? ProvinceAttributesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'publishedAt': _publishedAt,
        'locale': _locale,
        'key': _key,
        'Province': _province,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'publishedAt': serializeParam(
          _publishedAt,
          ParamType.String,
        ),
        'locale': serializeParam(
          _locale,
          ParamType.String,
        ),
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'Province': serializeParam(
          _province,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProvinceAttributesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProvinceAttributesStruct(
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updatedAt'],
          ParamType.String,
          false,
        ),
        publishedAt: deserializeParam(
          data['publishedAt'],
          ParamType.String,
          false,
        ),
        locale: deserializeParam(
          data['locale'],
          ParamType.String,
          false,
        ),
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        province: deserializeParam(
          data['Province'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProvinceAttributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProvinceAttributesStruct &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        publishedAt == other.publishedAt &&
        locale == other.locale &&
        key == other.key &&
        province == other.province;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([createdAt, updatedAt, publishedAt, locale, key, province]);
}

ProvinceAttributesStruct createProvinceAttributesStruct({
  String? createdAt,
  String? updatedAt,
  String? publishedAt,
  String? locale,
  String? key,
  String? province,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProvinceAttributesStruct(
      createdAt: createdAt,
      updatedAt: updatedAt,
      publishedAt: publishedAt,
      locale: locale,
      key: key,
      province: province,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProvinceAttributesStruct? updateProvinceAttributesStruct(
  ProvinceAttributesStruct? provinceAttributes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    provinceAttributes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProvinceAttributesStructData(
  Map<String, dynamic> firestoreData,
  ProvinceAttributesStruct? provinceAttributes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (provinceAttributes == null) {
    return;
  }
  if (provinceAttributes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && provinceAttributes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final provinceAttributesData =
      getProvinceAttributesFirestoreData(provinceAttributes, forFieldValue);
  final nestedData =
      provinceAttributesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      provinceAttributes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProvinceAttributesFirestoreData(
  ProvinceAttributesStruct? provinceAttributes, [
  bool forFieldValue = false,
]) {
  if (provinceAttributes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(provinceAttributes.toMap());

  // Add any Firestore field values
  provinceAttributes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProvinceAttributesListFirestoreData(
  List<ProvinceAttributesStruct>? provinceAttributess,
) =>
    provinceAttributess
        ?.map((e) => getProvinceAttributesFirestoreData(e, true))
        .toList() ??
    [];
