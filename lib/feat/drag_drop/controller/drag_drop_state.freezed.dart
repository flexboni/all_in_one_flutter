// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drag_drop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DragDropState {
  List<CurriculumData> get subjectList => throw _privateConstructorUsedError;
  List<CurriculumData> get todyLearnList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DragDropStateCopyWith<DragDropState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DragDropStateCopyWith<$Res> {
  factory $DragDropStateCopyWith(
          DragDropState value, $Res Function(DragDropState) then) =
      _$DragDropStateCopyWithImpl<$Res, DragDropState>;
  @useResult
  $Res call(
      {List<CurriculumData> subjectList, List<CurriculumData> todyLearnList});
}

/// @nodoc
class _$DragDropStateCopyWithImpl<$Res, $Val extends DragDropState>
    implements $DragDropStateCopyWith<$Res> {
  _$DragDropStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectList = null,
    Object? todyLearnList = null,
  }) {
    return _then(_value.copyWith(
      subjectList: null == subjectList
          ? _value.subjectList
          : subjectList // ignore: cast_nullable_to_non_nullable
              as List<CurriculumData>,
      todyLearnList: null == todyLearnList
          ? _value.todyLearnList
          : todyLearnList // ignore: cast_nullable_to_non_nullable
              as List<CurriculumData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DragDropStateImplCopyWith<$Res>
    implements $DragDropStateCopyWith<$Res> {
  factory _$$DragDropStateImplCopyWith(
          _$DragDropStateImpl value, $Res Function(_$DragDropStateImpl) then) =
      __$$DragDropStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<CurriculumData> subjectList, List<CurriculumData> todyLearnList});
}

/// @nodoc
class __$$DragDropStateImplCopyWithImpl<$Res>
    extends _$DragDropStateCopyWithImpl<$Res, _$DragDropStateImpl>
    implements _$$DragDropStateImplCopyWith<$Res> {
  __$$DragDropStateImplCopyWithImpl(
      _$DragDropStateImpl _value, $Res Function(_$DragDropStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectList = null,
    Object? todyLearnList = null,
  }) {
    return _then(_$DragDropStateImpl(
      subjectList: null == subjectList
          ? _value._subjectList
          : subjectList // ignore: cast_nullable_to_non_nullable
              as List<CurriculumData>,
      todyLearnList: null == todyLearnList
          ? _value._todyLearnList
          : todyLearnList // ignore: cast_nullable_to_non_nullable
              as List<CurriculumData>,
    ));
  }
}

/// @nodoc

class _$DragDropStateImpl implements _DragDropState {
  const _$DragDropStateImpl(
      {required final List<CurriculumData> subjectList,
      required final List<CurriculumData> todyLearnList})
      : _subjectList = subjectList,
        _todyLearnList = todyLearnList;

  final List<CurriculumData> _subjectList;
  @override
  List<CurriculumData> get subjectList {
    if (_subjectList is EqualUnmodifiableListView) return _subjectList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjectList);
  }

  final List<CurriculumData> _todyLearnList;
  @override
  List<CurriculumData> get todyLearnList {
    if (_todyLearnList is EqualUnmodifiableListView) return _todyLearnList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todyLearnList);
  }

  @override
  String toString() {
    return 'DragDropState(subjectList: $subjectList, todyLearnList: $todyLearnList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragDropStateImpl &&
            const DeepCollectionEquality()
                .equals(other._subjectList, _subjectList) &&
            const DeepCollectionEquality()
                .equals(other._todyLearnList, _todyLearnList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_subjectList),
      const DeepCollectionEquality().hash(_todyLearnList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DragDropStateImplCopyWith<_$DragDropStateImpl> get copyWith =>
      __$$DragDropStateImplCopyWithImpl<_$DragDropStateImpl>(this, _$identity);
}

abstract class _DragDropState implements DragDropState {
  const factory _DragDropState(
      {required final List<CurriculumData> subjectList,
      required final List<CurriculumData> todyLearnList}) = _$DragDropStateImpl;

  @override
  List<CurriculumData> get subjectList;
  @override
  List<CurriculumData> get todyLearnList;
  @override
  @JsonKey(ignore: true)
  _$$DragDropStateImplCopyWith<_$DragDropStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
