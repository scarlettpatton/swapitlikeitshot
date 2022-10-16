// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources_i_d_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResourcesIDRecord> _$resourcesIDRecordSerializer =
    new _$ResourcesIDRecordSerializer();

class _$ResourcesIDRecordSerializer
    implements StructuredSerializer<ResourcesIDRecord> {
  @override
  final Iterable<Type> types = const [ResourcesIDRecord, _$ResourcesIDRecord];
  @override
  final String wireName = 'ResourcesIDRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ResourcesIDRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ResourcesIDRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResourcesIDRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ResourcesIDRecord extends ResourcesIDRecord {
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? url;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ResourcesIDRecord(
          [void Function(ResourcesIDRecordBuilder)? updates]) =>
      (new ResourcesIDRecordBuilder()..update(updates))._build();

  _$ResourcesIDRecord._({this.title, this.image, this.url, this.ffRef})
      : super._();

  @override
  ResourcesIDRecord rebuild(void Function(ResourcesIDRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResourcesIDRecordBuilder toBuilder() =>
      new ResourcesIDRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResourcesIDRecord &&
        title == other.title &&
        image == other.image &&
        url == other.url &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, title.hashCode), image.hashCode), url.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ResourcesIDRecord')
          ..add('title', title)
          ..add('image', image)
          ..add('url', url)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ResourcesIDRecordBuilder
    implements Builder<ResourcesIDRecord, ResourcesIDRecordBuilder> {
  _$ResourcesIDRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ResourcesIDRecordBuilder() {
    ResourcesIDRecord._initializeBuilder(this);
  }

  ResourcesIDRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _image = $v.image;
      _url = $v.url;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResourcesIDRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ResourcesIDRecord;
  }

  @override
  void update(void Function(ResourcesIDRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ResourcesIDRecord build() => _build();

  _$ResourcesIDRecord _build() {
    final _$result = _$v ??
        new _$ResourcesIDRecord._(
            title: title, image: image, url: url, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
