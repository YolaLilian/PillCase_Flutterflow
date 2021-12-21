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
  @BuiltValueField(wireName: 'planned_date_reference')
  DocumentReference get plannedDateReference;

  @nullable
  int get index;

  @nullable
  BuiltList<DocumentReference> get pills;

  @nullable
  String get status;

  @nullable
  DateTime get time;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CompartmentsRecordBuilder builder) => builder
    ..index = 0
    ..pills = ListBuilder()
    ..status = ''
    ..name = '';

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
  DocumentReference plannedDateReference,
  int index,
  String status,
  DateTime time,
  String name,
}) =>
    serializers.toFirestore(
        CompartmentsRecord.serializer,
        CompartmentsRecord((c) => c
          ..plannedDateReference = plannedDateReference
          ..index = index
          ..pills = null
          ..status = status
          ..time = time
          ..name = name));
