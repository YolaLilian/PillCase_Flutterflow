import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_collection_record.g.dart';

abstract class UsersCollectionRecord
    implements Built<UsersCollectionRecord, UsersCollectionRecordBuilder> {
  static Serializer<UsersCollectionRecord> get serializer =>
      _$usersCollectionRecordSerializer;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'full_name')
  BuiltList<String> get fullName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersCollectionRecordBuilder builder) =>
      builder
        ..email = ''
        ..displayName = ''
        ..uid = ''
        ..fullName = ListBuilder()
        ..photoUrl = ''
        ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users_collection');

  static Stream<UsersCollectionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersCollectionRecord._();
  factory UsersCollectionRecord(
          [void Function(UsersCollectionRecordBuilder) updates]) =
      _$UsersCollectionRecord;

  static UsersCollectionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersCollectionRecordData({
  String email,
  String displayName,
  String uid,
  DateTime createdTime,
  String photoUrl,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        UsersCollectionRecord.serializer,
        UsersCollectionRecord((u) => u
          ..email = email
          ..displayName = displayName
          ..uid = uid
          ..createdTime = createdTime
          ..fullName = null
          ..photoUrl = photoUrl
          ..phoneNumber = phoneNumber));
