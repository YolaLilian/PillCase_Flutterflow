// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compartments_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CompartmentsRecord> _$compartmentsRecordSerializer =
    new _$CompartmentsRecordSerializer();

class _$CompartmentsRecordSerializer
    implements StructuredSerializer<CompartmentsRecord> {
  @override
  final Iterable<Type> types = const [CompartmentsRecord, _$CompartmentsRecord];
  @override
  final String wireName = 'CompartmentsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CompartmentsRecord object,
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
    value = object.index;
    if (value != null) {
      result
        ..add('index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.plannedDate;
    if (value != null) {
      result
        ..add('planned_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
    value = object.pills;
    if (value != null) {
      result
        ..add('pills')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  CompartmentsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CompartmentsRecordBuilder();

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
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'planned_date':
          result.plannedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
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
        case 'pills':
          result.pills.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$CompartmentsRecord extends CompartmentsRecord {
  @override
  final String name;
  @override
  final int index;
  @override
  final DateTime plannedDate;
  @override
  final BuiltList<DocumentReference<Object>> users;
  @override
  final DocumentReference<Object> user;
  @override
  final BuiltList<DocumentReference<Object>> pills;
  @override
  final DocumentReference<Object> reference;

  factory _$CompartmentsRecord(
          [void Function(CompartmentsRecordBuilder) updates]) =>
      (new CompartmentsRecordBuilder()..update(updates)).build();

  _$CompartmentsRecord._(
      {this.name,
      this.index,
      this.plannedDate,
      this.users,
      this.user,
      this.pills,
      this.reference})
      : super._();

  @override
  CompartmentsRecord rebuild(
          void Function(CompartmentsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompartmentsRecordBuilder toBuilder() =>
      new CompartmentsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompartmentsRecord &&
        name == other.name &&
        index == other.index &&
        plannedDate == other.plannedDate &&
        users == other.users &&
        user == other.user &&
        pills == other.pills &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), index.hashCode),
                        plannedDate.hashCode),
                    users.hashCode),
                user.hashCode),
            pills.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CompartmentsRecord')
          ..add('name', name)
          ..add('index', index)
          ..add('plannedDate', plannedDate)
          ..add('users', users)
          ..add('user', user)
          ..add('pills', pills)
          ..add('reference', reference))
        .toString();
  }
}

class CompartmentsRecordBuilder
    implements Builder<CompartmentsRecord, CompartmentsRecordBuilder> {
  _$CompartmentsRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _index;
  int get index => _$this._index;
  set index(int index) => _$this._index = index;

  DateTime _plannedDate;
  DateTime get plannedDate => _$this._plannedDate;
  set plannedDate(DateTime plannedDate) => _$this._plannedDate = plannedDate;

  ListBuilder<DocumentReference<Object>> _users;
  ListBuilder<DocumentReference<Object>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object>>();
  set users(ListBuilder<DocumentReference<Object>> users) =>
      _$this._users = users;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  ListBuilder<DocumentReference<Object>> _pills;
  ListBuilder<DocumentReference<Object>> get pills =>
      _$this._pills ??= new ListBuilder<DocumentReference<Object>>();
  set pills(ListBuilder<DocumentReference<Object>> pills) =>
      _$this._pills = pills;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CompartmentsRecordBuilder() {
    CompartmentsRecord._initializeBuilder(this);
  }

  CompartmentsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _index = $v.index;
      _plannedDate = $v.plannedDate;
      _users = $v.users?.toBuilder();
      _user = $v.user;
      _pills = $v.pills?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompartmentsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompartmentsRecord;
  }

  @override
  void update(void Function(CompartmentsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CompartmentsRecord build() {
    _$CompartmentsRecord _$result;
    try {
      _$result = _$v ??
          new _$CompartmentsRecord._(
              name: name,
              index: index,
              plannedDate: plannedDate,
              users: _users?.build(),
              user: user,
              pills: _pills?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();

        _$failedField = 'pills';
        _pills?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CompartmentsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
