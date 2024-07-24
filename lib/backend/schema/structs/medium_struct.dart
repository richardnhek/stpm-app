// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MediumStruct extends FFFirebaseStruct {
  MediumStruct({
    String? ext,
    String? url,
    String? hash,
    String? mime,
    String? name,
    String? path,
    double? size,
    int? width,
    int? height,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _ext = ext,
        _url = url,
        _hash = hash,
        _mime = mime,
        _name = name,
        _path = path,
        _size = size,
        _width = width,
        _height = height,
        super(firestoreUtilData);

  // "ext" field.
  String? _ext;
  String get ext => _ext ?? '';
  set ext(String? val) => _ext = val;

  bool hasExt() => _ext != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "hash" field.
  String? _hash;
  String get hash => _hash ?? '';
  set hash(String? val) => _hash = val;

  bool hasHash() => _hash != null;

  // "mime" field.
  String? _mime;
  String get mime => _mime ?? '';
  set mime(String? val) => _mime = val;

  bool hasMime() => _mime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;

  void incrementSize(double amount) => size = size + amount;

  bool hasSize() => _size != null;

  // "width" field.
  int? _width;
  int get width => _width ?? 0;
  set width(int? val) => _width = val;

  void incrementWidth(int amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;

  void incrementHeight(int amount) => height = height + amount;

  bool hasHeight() => _height != null;

  static MediumStruct fromMap(Map<String, dynamic> data) => MediumStruct(
        ext: data['ext'] as String?,
        url: data['url'] as String?,
        hash: data['hash'] as String?,
        mime: data['mime'] as String?,
        name: data['name'] as String?,
        path: data['path'] as String?,
        size: castToType<double>(data['size']),
        width: castToType<int>(data['width']),
        height: castToType<int>(data['height']),
      );

  static MediumStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediumStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ext': _ext,
        'url': _url,
        'hash': _hash,
        'mime': _mime,
        'name': _name,
        'path': _path,
        'size': _size,
        'width': _width,
        'height': _height,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ext': serializeParam(
          _ext,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'hash': serializeParam(
          _hash,
          ParamType.String,
        ),
        'mime': serializeParam(
          _mime,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
      }.withoutNulls;

  static MediumStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediumStruct(
        ext: deserializeParam(
          data['ext'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        hash: deserializeParam(
          data['hash'],
          ParamType.String,
          false,
        ),
        mime: deserializeParam(
          data['mime'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MediumStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediumStruct &&
        ext == other.ext &&
        url == other.url &&
        hash == other.hash &&
        mime == other.mime &&
        name == other.name &&
        path == other.path &&
        size == other.size &&
        width == other.width &&
        height == other.height;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([ext, url, hash, mime, name, path, size, width, height]);
}

MediumStruct createMediumStruct({
  String? ext,
  String? url,
  String? hash,
  String? mime,
  String? name,
  String? path,
  double? size,
  int? width,
  int? height,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MediumStruct(
      ext: ext,
      url: url,
      hash: hash,
      mime: mime,
      name: name,
      path: path,
      size: size,
      width: width,
      height: height,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MediumStruct? updateMediumStruct(
  MediumStruct? medium, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    medium
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMediumStructData(
  Map<String, dynamic> firestoreData,
  MediumStruct? medium,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (medium == null) {
    return;
  }
  if (medium.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && medium.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mediumData = getMediumFirestoreData(medium, forFieldValue);
  final nestedData = mediumData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = medium.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMediumFirestoreData(
  MediumStruct? medium, [
  bool forFieldValue = false,
]) {
  if (medium == null) {
    return {};
  }
  final firestoreData = mapToFirestore(medium.toMap());

  // Add any Firestore field values
  medium.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMediumListFirestoreData(
  List<MediumStruct>? mediums,
) =>
    mediums?.map((e) => getMediumFirestoreData(e, true)).toList() ?? [];
