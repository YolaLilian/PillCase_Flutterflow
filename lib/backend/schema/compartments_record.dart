import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'compartments_record.g.dart';

abstract class CompartmentsRecord
    implements Built<CompartmentsRecord, CompartmentsRecordBuilder> {
  static Serializer<CompartmentsRecord> get serializer =>
      _$compartmentsRecordSerializer;

  @nullable
  String get name;

  @nullable
  int get index;

  @nullable
  @BuiltValueField(wireName: 'planned_date')
  DateTime get plannedDate;

  @nullable
  BuiltList<DocumentReference> get users;

  @nullable
  DocumentReference get user;

  @nullable
  BuiltList<DocumentReference> get pills;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CompartmentsRecordBuilder builder) => builder
    ..name = ''
    ..index = 0
    ..users = ListBuilder()
    ..pills = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('compartments');

  static Stream<CompartmentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CompartmentsRecord._();
  factory CompartmentsRecord(
          [void Function(CompartmentsRecordBuilder) updates]) =
      _$CompartmentsRecord;

  static CompartmentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCompartmentsRecordData({
  String name,
  int index,
  DateTime plannedDate,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        CompartmentsRecord.serializer,
        CompartmentsRecord((c) => c
          ..name = name
          ..index = index
          ..plannedDate = plannedDate
          ..users = null
          ..user = user
          ..pills = null));
