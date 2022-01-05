// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pills_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PillsRecord> _$pillsRecordSerializer = new _$PillsRecordSerializer();

class _$PillsRecordSerializer implements StructuredSerializer<PillsRecord> {
  @override
  final Iterable<Type> types = const [PillsRecord, _$PillsRecord];
  @override
  final String wireName = 'PillsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PillsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  PillsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PillsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$PillsRecord extends PillsRecord {
  @override
  final String name;
  @override
  final BuiltList<DocumentReference<Object>> users;
  @override
  final DocumentReference<Object> user;
  @override
  final DocumentReference<Object> reference;

  factory _$PillsRecord([void Function(PillsRecordBuilder) updates]) =>
      (new PillsRecordBuilder()..update(updates)).build();

  _$PillsRecord._({this.name, this.users, this.user, this.reference})
      : super._();

  @override
  PillsRecord rebuild(void Function(PillsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PillsRecordBuilder toBuilder() => new PillsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PillsRecord &&
        name == other.name &&
        users == other.users &&
        user == other.user &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), users.hashCode), user.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PillsRecord')
          ..add('name', name)
          ..add('users', users)
          ..add('user', user)
          ..add('reference', reference))
        .toString();
  }
}

class PillsRecordBuilder implements Builder<PillsRecord, PillsRecordBuilder> {
  _$PillsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ListBuilder<DocumentReference<Object>> _users;
  ListBuilder<DocumentReference<Object>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object>>();
  set users(ListBuilder<DocumentReference<Object>> users) =>
      _$this._users = users;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PillsRecordBuilder() {
    PillsRecord._initializeBuilder(this);
  }

  PillsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _users = $v.users?.toBuilder();
      _user = $v.user;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PillsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PillsRecord;
  }

  @override
  void update(void Function(PillsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PillsRecord build() {
    _$PillsRecord _$result;
    try {
      _$result = _$v ??
          new _$PillsRecord._(
              name: name,
              users: _users?.build(),
              user: user,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PillsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
