// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FormatsStruct extends FFFirebaseStruct {
  FormatsStruct({
    SmallStruct? small,
    MediumStruct? medium,
    ThumbnailStruct? thumbnail,
    LargeStruct? large,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _small = small,
        _medium = medium,
        _thumbnail = thumbnail,
        _large = large,
        super(firestoreUtilData);

  // "small" field.
  SmallStruct? _small;
  SmallStruct get small => _small ?? SmallStruct();
  set small(SmallStruct? val) => _small = val;

  void updateSmall(Function(SmallStruct) updateFn) {
    updateFn(_small ??= SmallStruct());
  }

  bool hasSmall() => _small != null;

  // "medium" field.
  MediumStruct? _medium;
  MediumStruct get medium => _medium ?? MediumStruct();
  set medium(MediumStruct? val) => _medium = val;

  void updateMedium(Function(MediumStruct) updateFn) {
    updateFn(_medium ??= MediumStruct());
  }

  bool hasMedium() => _medium != null;

  // "thumbnail" field.
  ThumbnailStruct? _thumbnail;
  ThumbnailStruct get thumbnail => _thumbnail ?? ThumbnailStruct();
  set thumbnail(ThumbnailStruct? val) => _thumbnail = val;

  void updateThumbnail(Function(ThumbnailStruct) updateFn) {
    updateFn(_thumbnail ??= ThumbnailStruct());
  }

  bool hasThumbnail() => _thumbnail != null;

  // "large" field.
  LargeStruct? _large;
  LargeStruct get large => _large ?? LargeStruct();
  set large(LargeStruct? val) => _large = val;

  void updateLarge(Function(LargeStruct) updateFn) {
    updateFn(_large ??= LargeStruct());
  }

  bool hasLarge() => _large != null;

  static FormatsStruct fromMap(Map<String, dynamic> data) => FormatsStruct(
        small: SmallStruct.maybeFromMap(data['small']),
        medium: MediumStruct.maybeFromMap(data['medium']),
        thumbnail: ThumbnailStruct.maybeFromMap(data['thumbnail']),
        large: LargeStruct.maybeFromMap(data['large']),
      );

  static FormatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? FormatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'small': _small?.toMap(),
        'medium': _medium?.toMap(),
        'thumbnail': _thumbnail?.toMap(),
        'large': _large?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'small': serializeParam(
          _small,
          ParamType.DataStruct,
        ),
        'medium': serializeParam(
          _medium,
          ParamType.DataStruct,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.DataStruct,
        ),
        'large': serializeParam(
          _large,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FormatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FormatsStruct(
        small: deserializeStructParam(
          data['small'],
          ParamType.DataStruct,
          false,
          structBuilder: SmallStruct.fromSerializableMap,
        ),
        medium: deserializeStructParam(
          data['medium'],
          ParamType.DataStruct,
          false,
          structBuilder: MediumStruct.fromSerializableMap,
        ),
        thumbnail: deserializeStructParam(
          data['thumbnail'],
          ParamType.DataStruct,
          false,
          structBuilder: ThumbnailStruct.fromSerializableMap,
        ),
        large: deserializeStructParam(
          data['large'],
          ParamType.DataStruct,
          false,
          structBuilder: LargeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FormatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FormatsStruct &&
        small == other.small &&
        medium == other.medium &&
        thumbnail == other.thumbnail &&
        large == other.large;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([small, medium, thumbnail, large]);
}

FormatsStruct createFormatsStruct({
  SmallStruct? small,
  MediumStruct? medium,
  ThumbnailStruct? thumbnail,
  LargeStruct? large,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FormatsStruct(
      small: small ?? (clearUnsetFields ? SmallStruct() : null),
      medium: medium ?? (clearUnsetFields ? MediumStruct() : null),
      thumbnail: thumbnail ?? (clearUnsetFields ? ThumbnailStruct() : null),
      large: large ?? (clearUnsetFields ? LargeStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FormatsStruct? updateFormatsStruct(
  FormatsStruct? formats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    formats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFormatsStructData(
  Map<String, dynamic> firestoreData,
  FormatsStruct? formats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (formats == null) {
    return;
  }
  if (formats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && formats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final formatsData = getFormatsFirestoreData(formats, forFieldValue);
  final nestedData = formatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = formats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFormatsFirestoreData(
  FormatsStruct? formats, [
  bool forFieldValue = false,
]) {
  if (formats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(formats.toMap());

  // Handle nested data for "small" field.
  addSmallStructData(
    firestoreData,
    formats.hasSmall() ? formats.small : null,
    'small',
    forFieldValue,
  );

  // Handle nested data for "medium" field.
  addMediumStructData(
    firestoreData,
    formats.hasMedium() ? formats.medium : null,
    'medium',
    forFieldValue,
  );

  // Handle nested data for "thumbnail" field.
  addThumbnailStructData(
    firestoreData,
    formats.hasThumbnail() ? formats.thumbnail : null,
    'thumbnail',
    forFieldValue,
  );

  // Handle nested data for "large" field.
  addLargeStructData(
    firestoreData,
    formats.hasLarge() ? formats.large : null,
    'large',
    forFieldValue,
  );

  // Add any Firestore field values
  formats.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFormatsListFirestoreData(
  List<FormatsStruct>? formatss,
) =>
    formatss?.map((e) => getFormatsFirestoreData(e, true)).toList() ?? [];
