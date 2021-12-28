import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'pills_record.g.dart';

abstract class PillsRecord implements Built<PillsRecord, PillsRecordBuilder> {
  static Serializer<PillsRecord> get serializer => _$pillsRecordSerializer;

  @nullable
  String get name;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PillsRecordBuilder builder) => builder
    ..name = ''
    ..users = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pills');

  static Stream<PillsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PillsRecord._();
  factory PillsRecord([void Function(PillsRecordBuilder) updates]) =
      _$PillsRecord;

  static PillsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPillsRecordData({
  String name,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        PillsRecord.serializer,
        PillsRecord((p) => p
          ..name = name
          ..users = null
          ..user = user));
