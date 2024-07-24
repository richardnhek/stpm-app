// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttributesStruct extends FFFirebaseStruct {
  AttributesStruct({
    String? name,
    String? alternativeText,
    String? caption,
    int? width,
    int? height,
    FormatsStruct? formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    String? previewUrl,
    String? provider,
    String? providerMetadata,
    String? createdAt,
    String? updatedAt,
    String? title,
    String? description,
    String? publishedAt,
    String? locale,
    String? date,
    String? key,
    DataStruct? province,
    ThumbnailDataStruct? thumbnail,
    CategoryStruct? category,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _alternativeText = alternativeText,
        _caption = caption,
        _width = width,
        _height = height,
        _formats = formats,
        _hash = hash,
        _ext = ext,
        _mime = mime,
        _size = size,
        _url = url,
        _previewUrl = previewUrl,
        _provider = provider,
        _providerMetadata = providerMetadata,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _title = title,
        _description = description,
        _publishedAt = publishedAt,
        _locale = locale,
        _date = date,
        _key = key,
        _province = province,
        _thumbnail = thumbnail,
        _category = category,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "alternativeText" field.
  String? _alternativeText;
  String get alternativeText => _alternativeText ?? '';
  set alternativeText(String? val) => _alternativeText = val;

  bool hasAlternativeText() => _alternativeText != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  set caption(String? val) => _caption = val;

  bool hasCaption() => _caption != null;

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

  // "formats" field.
  FormatsStruct? _formats;
  FormatsStruct get formats => _formats ?? FormatsStruct();
  set formats(FormatsStruct? val) => _formats = val;

  void updateFormats(Function(FormatsStruct) updateFn) {
    updateFn(_formats ??= FormatsStruct());
  }

  bool hasFormats() => _formats != null;

  // "hash" field.
  String? _hash;
  String get hash => _hash ?? '';
  set hash(String? val) => _hash = val;

  bool hasHash() => _hash != null;

  // "ext" field.
  String? _ext;
  String get ext => _ext ?? '';
  set ext(String? val) => _ext = val;

  bool hasExt() => _ext != null;

  // "mime" field.
  String? _mime;
  String get mime => _mime ?? '';
  set mime(String? val) => _mime = val;

  bool hasMime() => _mime != null;

  // "size" field.
  double? _size;
  double get size => _size ?? 0.0;
  set size(double? val) => _size = val;

  void incrementSize(double amount) => size = size + amount;

  bool hasSize() => _size != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "previewUrl" field.
  String? _previewUrl;
  String get previewUrl => _previewUrl ?? '';
  set previewUrl(String? val) => _previewUrl = val;

  bool hasPreviewUrl() => _previewUrl != null;

  // "provider" field.
  String? _provider;
  String get provider => _provider ?? '';
  set provider(String? val) => _provider = val;

  bool hasProvider() => _provider != null;

  // "provider_metadata" field.
  String? _providerMetadata;
  String get providerMetadata => _providerMetadata ?? '';
  set providerMetadata(String? val) => _providerMetadata = val;

  bool hasProviderMetadata() => _providerMetadata != null;

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

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "province" field.
  DataStruct? _province;
  DataStruct get province => _province ?? DataStruct();
  set province(DataStruct? val) => _province = val;

  void updateProvince(Function(DataStruct) updateFn) {
    updateFn(_province ??= DataStruct());
  }

  bool hasProvince() => _province != null;

  // "thumbnail" field.
  ThumbnailDataStruct? _thumbnail;
  ThumbnailDataStruct get thumbnail => _thumbnail ?? ThumbnailDataStruct();
  set thumbnail(ThumbnailDataStruct? val) => _thumbnail = val;

  void updateThumbnail(Function(ThumbnailDataStruct) updateFn) {
    updateFn(_thumbnail ??= ThumbnailDataStruct());
  }

  bool hasThumbnail() => _thumbnail != null;

  // "category" field.
  CategoryStruct? _category;
  CategoryStruct get category => _category ?? CategoryStruct();
  set category(CategoryStruct? val) => _category = val;

  void updateCategory(Function(CategoryStruct) updateFn) {
    updateFn(_category ??= CategoryStruct());
  }

  bool hasCategory() => _category != null;

  static AttributesStruct fromMap(Map<String, dynamic> data) =>
      AttributesStruct(
        name: data['name'] as String?,
        alternativeText: data['alternativeText'] as String?,
        caption: data['caption'] as String?,
        width: castToType<int>(data['width']),
        height: castToType<int>(data['height']),
        formats: FormatsStruct.maybeFromMap(data['formats']),
        hash: data['hash'] as String?,
        ext: data['ext'] as String?,
        mime: data['mime'] as String?,
        size: castToType<double>(data['size']),
        url: data['url'] as String?,
        previewUrl: data['previewUrl'] as String?,
        provider: data['provider'] as String?,
        providerMetadata: data['provider_metadata'] as String?,
        createdAt: data['createdAt'] as String?,
        updatedAt: data['updatedAt'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        publishedAt: data['publishedAt'] as String?,
        locale: data['locale'] as String?,
        date: data['Date'] as String?,
        key: data['key'] as String?,
        province: DataStruct.maybeFromMap(data['province']),
        thumbnail: ThumbnailDataStruct.maybeFromMap(data['thumbnail']),
        category: CategoryStruct.maybeFromMap(data['category']),
      );

  static AttributesStruct? maybeFromMap(dynamic data) => data is Map
      ? AttributesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'alternativeText': _alternativeText,
        'caption': _caption,
        'width': _width,
        'height': _height,
        'formats': _formats?.toMap(),
        'hash': _hash,
        'ext': _ext,
        'mime': _mime,
        'size': _size,
        'url': _url,
        'previewUrl': _previewUrl,
        'provider': _provider,
        'provider_metadata': _providerMetadata,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt,
        'title': _title,
        'description': _description,
        'publishedAt': _publishedAt,
        'locale': _locale,
        'Date': _date,
        'key': _key,
        'province': _province?.toMap(),
        'thumbnail': _thumbnail?.toMap(),
        'category': _category?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'alternativeText': serializeParam(
          _alternativeText,
          ParamType.String,
        ),
        'caption': serializeParam(
          _caption,
          ParamType.String,
        ),
        'width': serializeParam(
          _width,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'formats': serializeParam(
          _formats,
          ParamType.DataStruct,
        ),
        'hash': serializeParam(
          _hash,
          ParamType.String,
        ),
        'ext': serializeParam(
          _ext,
          ParamType.String,
        ),
        'mime': serializeParam(
          _mime,
          ParamType.String,
        ),
        'size': serializeParam(
          _size,
          ParamType.double,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'previewUrl': serializeParam(
          _previewUrl,
          ParamType.String,
        ),
        'provider': serializeParam(
          _provider,
          ParamType.String,
        ),
        'provider_metadata': serializeParam(
          _providerMetadata,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updatedAt': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
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
        'Date': serializeParam(
          _date,
          ParamType.String,
        ),
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'province': serializeParam(
          _province,
          ParamType.DataStruct,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.DataStruct,
        ),
        'category': serializeParam(
          _category,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AttributesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttributesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        alternativeText: deserializeParam(
          data['alternativeText'],
          ParamType.String,
          false,
        ),
        caption: deserializeParam(
          data['caption'],
          ParamType.String,
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
        formats: deserializeStructParam(
          data['formats'],
          ParamType.DataStruct,
          false,
          structBuilder: FormatsStruct.fromSerializableMap,
        ),
        hash: deserializeParam(
          data['hash'],
          ParamType.String,
          false,
        ),
        ext: deserializeParam(
          data['ext'],
          ParamType.String,
          false,
        ),
        mime: deserializeParam(
          data['mime'],
          ParamType.String,
          false,
        ),
        size: deserializeParam(
          data['size'],
          ParamType.double,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        previewUrl: deserializeParam(
          data['previewUrl'],
          ParamType.String,
          false,
        ),
        provider: deserializeParam(
          data['provider'],
          ParamType.String,
          false,
        ),
        providerMetadata: deserializeParam(
          data['provider_metadata'],
          ParamType.String,
          false,
        ),
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
        date: deserializeParam(
          data['Date'],
          ParamType.String,
          false,
        ),
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        province: deserializeStructParam(
          data['province'],
          ParamType.DataStruct,
          false,
          structBuilder: DataStruct.fromSerializableMap,
        ),
        thumbnail: deserializeStructParam(
          data['thumbnail'],
          ParamType.DataStruct,
          false,
          structBuilder: ThumbnailDataStruct.fromSerializableMap,
        ),
        category: deserializeStructParam(
          data['category'],
          ParamType.DataStruct,
          false,
          structBuilder: CategoryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AttributesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttributesStruct &&
        name == other.name &&
        alternativeText == other.alternativeText &&
        caption == other.caption &&
        width == other.width &&
        height == other.height &&
        formats == other.formats &&
        hash == other.hash &&
        ext == other.ext &&
        mime == other.mime &&
        size == other.size &&
        url == other.url &&
        previewUrl == other.previewUrl &&
        provider == other.provider &&
        providerMetadata == other.providerMetadata &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        title == other.title &&
        description == other.description &&
        publishedAt == other.publishedAt &&
        locale == other.locale &&
        date == other.date &&
        key == other.key &&
        province == other.province &&
        thumbnail == other.thumbnail &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        alternativeText,
        caption,
        width,
        height,
        formats,
        hash,
        ext,
        mime,
        size,
        url,
        previewUrl,
        provider,
        providerMetadata,
        createdAt,
        updatedAt,
        title,
        description,
        publishedAt,
        locale,
        date,
        key,
        province,
        thumbnail,
        category
      ]);
}

AttributesStruct createAttributesStruct({
  String? name,
  String? alternativeText,
  String? caption,
  int? width,
  int? height,
  FormatsStruct? formats,
  String? hash,
  String? ext,
  String? mime,
  double? size,
  String? url,
  String? previewUrl,
  String? provider,
  String? providerMetadata,
  String? createdAt,
  String? updatedAt,
  String? title,
  String? description,
  String? publishedAt,
  String? locale,
  String? date,
  String? key,
  DataStruct? province,
  ThumbnailDataStruct? thumbnail,
  CategoryStruct? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttributesStruct(
      name: name,
      alternativeText: alternativeText,
      caption: caption,
      width: width,
      height: height,
      formats: formats ?? (clearUnsetFields ? FormatsStruct() : null),
      hash: hash,
      ext: ext,
      mime: mime,
      size: size,
      url: url,
      previewUrl: previewUrl,
      provider: provider,
      providerMetadata: providerMetadata,
      createdAt: createdAt,
      updatedAt: updatedAt,
      title: title,
      description: description,
      publishedAt: publishedAt,
      locale: locale,
      date: date,
      key: key,
      province: province ?? (clearUnsetFields ? DataStruct() : null),
      thumbnail: thumbnail ?? (clearUnsetFields ? ThumbnailDataStruct() : null),
      category: category ?? (clearUnsetFields ? CategoryStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttributesStruct? updateAttributesStruct(
  AttributesStruct? attributes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attributes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttributesStructData(
  Map<String, dynamic> firestoreData,
  AttributesStruct? attributes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attributes == null) {
    return;
  }
  if (attributes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attributes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attributesData = getAttributesFirestoreData(attributes, forFieldValue);
  final nestedData = attributesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attributes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttributesFirestoreData(
  AttributesStruct? attributes, [
  bool forFieldValue = false,
]) {
  if (attributes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attributes.toMap());

  // Handle nested data for "formats" field.
  addFormatsStructData(
    firestoreData,
    attributes.hasFormats() ? attributes.formats : null,
    'formats',
    forFieldValue,
  );

  // Handle nested data for "province" field.
  addDataStructData(
    firestoreData,
    attributes.hasProvince() ? attributes.province : null,
    'province',
    forFieldValue,
  );

  // Handle nested data for "thumbnail" field.
  addThumbnailDataStructData(
    firestoreData,
    attributes.hasThumbnail() ? attributes.thumbnail : null,
    'thumbnail',
    forFieldValue,
  );

  // Handle nested data for "category" field.
  addCategoryStructData(
    firestoreData,
    attributes.hasCategory() ? attributes.category : null,
    'category',
    forFieldValue,
  );

  // Add any Firestore field values
  attributes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttributesListFirestoreData(
  List<AttributesStruct>? attributess,
) =>
    attributess?.map((e) => getAttributesFirestoreData(e, true)).toList() ?? [];
