// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pencil_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PencilState {
  Exam get exam => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PencilStateCopyWith<PencilState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PencilStateCopyWith<$Res> {
  factory $PencilStateCopyWith(
          PencilState value, $Res Function(PencilState) then) =
      _$PencilStateCopyWithImpl<$Res, PencilState>;
  @useResult
  $Res call({Exam exam, int currentIndex});

  $ExamCopyWith<$Res> get exam;
}

/// @nodoc
class _$PencilStateCopyWithImpl<$Res, $Val extends PencilState>
    implements $PencilStateCopyWith<$Res> {
  _$PencilStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exam = null,
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      exam: null == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as Exam,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ExamCopyWith<$Res> get exam {
    return $ExamCopyWith<$Res>(_value.exam, (value) {
      return _then(_value.copyWith(exam: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PencilStateImplCopyWith<$Res>
    implements $PencilStateCopyWith<$Res> {
  factory _$$PencilStateImplCopyWith(
          _$PencilStateImpl value, $Res Function(_$PencilStateImpl) then) =
      __$$PencilStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Exam exam, int currentIndex});

  @override
  $ExamCopyWith<$Res> get exam;
}

/// @nodoc
class __$$PencilStateImplCopyWithImpl<$Res>
    extends _$PencilStateCopyWithImpl<$Res, _$PencilStateImpl>
    implements _$$PencilStateImplCopyWith<$Res> {
  __$$PencilStateImplCopyWithImpl(
      _$PencilStateImpl _value, $Res Function(_$PencilStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exam = null,
    Object? currentIndex = null,
  }) {
    return _then(_$PencilStateImpl(
      exam: null == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as Exam,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PencilStateImpl implements _PencilState {
  const _$PencilStateImpl({required this.exam, required this.currentIndex});

  @override
  final Exam exam;
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'PencilState(exam: $exam, currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PencilStateImpl &&
            (identical(other.exam, exam) || other.exam == exam) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exam, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PencilStateImplCopyWith<_$PencilStateImpl> get copyWith =>
      __$$PencilStateImplCopyWithImpl<_$PencilStateImpl>(this, _$identity);
}

abstract class _PencilState implements PencilState {
  const factory _PencilState(
      {required final Exam exam,
      required final int currentIndex}) = _$PencilStateImpl;

  @override
  Exam get exam;
  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$PencilStateImplCopyWith<_$PencilStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
