import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'resources_i_d_record.g.dart';

abstract class ResourcesIDRecord
    implements Built<ResourcesIDRecord, ResourcesIDRecordBuilder> {
  static Serializer<ResourcesIDRecord> get serializer =>
      _$resourcesIDRecordSerializer;

  String? get title;

  String? get image;

  String? get url;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ResourcesIDRecordBuilder builder) => builder
    ..title = ''
    ..image = ''
    ..url = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resourcesID');

  static Stream<ResourcesIDRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ResourcesIDRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ResourcesIDRecord._();
  factory ResourcesIDRecord([void Function(ResourcesIDRecordBuilder) updates]) =
      _$ResourcesIDRecord;

  static ResourcesIDRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createResourcesIDRecordData({
  String? title,
  String? image,
  String? url,
}) {
  final firestoreData = serializers.toFirestore(
    ResourcesIDRecord.serializer,
    ResourcesIDRecord(
      (r) => r
        ..title = title
        ..image = image
        ..url = url,
    ),
  );

  return firestoreData;
}
