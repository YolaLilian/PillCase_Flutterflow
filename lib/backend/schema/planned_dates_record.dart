import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'planned_dates_record.g.dart';

abstract class PlannedDatesRecord
    implements Built<PlannedDatesRecord, PlannedDatesRecordBuilder> {
  static Serializer<PlannedDatesRecord> get serializer =>
      _$plannedDatesRecordSerializer;

  @nullable
  DateTime get day;

  @nullable
  BuiltList<DocumentReference> get compartments;

  @nullable
  @BuiltValueField(wireName: 'user_reference')
  DocumentReference get userReference;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PlannedDatesRecordBuilder builder) =>
      builder..compartments = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planned_dates');

  static Stream<PlannedDatesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PlannedDatesRecord._();
  factory PlannedDatesRecord(
          [void Function(PlannedDatesRecordBuilder) updates]) =
      _$PlannedDatesRecord;

  static PlannedDatesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPlannedDatesRecordData({
  DateTime day,
  DocumentReference userReference,
}) =>
    serializers.toFirestore(
        PlannedDatesRecord.serializer,
        PlannedDatesRecord((p) => p
          ..day = day
          ..compartments = null
          ..userReference = userReference));
