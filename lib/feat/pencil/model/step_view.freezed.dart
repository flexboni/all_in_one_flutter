// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepView _$StepViewFromJson(Map<String, dynamic> json) {
  return _StepView.fromJson(json);
}

/// @nodoc
mixin _$StepView {
  String? get code => throw _privateConstructorUsedError;
  int? get step => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  List<Step>? get steps => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
  List<Recommend>? get unionRecommends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepViewCopyWith<StepView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepViewCopyWith<$Res> {
  factory $StepViewCopyWith(StepView value, $Res Function(StepView) then) =
      _$StepViewCopyWithImpl<$Res, StepView>;
  @useResult
  $Res call(
      {String? code,
      int? step,
      String? title,
      List<Step>? steps,
      @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
      List<Recommend>? unionRecommends});
}

/// @nodoc
class _$StepViewCopyWithImpl<$Res, $Val extends StepView>
    implements $StepViewCopyWith<$Res> {
  _$StepViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? step = freezed,
    Object? title = freezed,
    Object? steps = freezed,
    Object? unionRecommends = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      unionRecommends: freezed == unionRecommends
          ? _value.unionRecommends
          : unionRecommends // ignore: cast_nullable_to_non_nullable
              as List<Recommend>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepViewImplCopyWith<$Res>
    implements $StepViewCopyWith<$Res> {
  factory _$$StepViewImplCopyWith(
          _$StepViewImpl value, $Res Function(_$StepViewImpl) then) =
      __$$StepViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      int? step,
      String? title,
      List<Step>? steps,
      @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
      List<Recommend>? unionRecommends});
}

/// @nodoc
class __$$StepViewImplCopyWithImpl<$Res>
    extends _$StepViewCopyWithImpl<$Res, _$StepViewImpl>
    implements _$$StepViewImplCopyWith<$Res> {
  __$$StepViewImplCopyWithImpl(
      _$StepViewImpl _value, $Res Function(_$StepViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? step = freezed,
    Object? title = freezed,
    Object? steps = freezed,
    Object? unionRecommends = freezed,
  }) {
    return _then(_$StepViewImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      unionRecommends: freezed == unionRecommends
          ? _value._unionRecommends
          : unionRecommends // ignore: cast_nullable_to_non_nullable
              as List<Recommend>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepViewImpl implements _StepView {
  const _$StepViewImpl(
      {this.code,
      this.step,
      this.title,
      final List<Step>? steps,
      @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
      final List<Recommend>? unionRecommends})
      : _steps = steps,
        _unionRecommends = unionRecommends;

  factory _$StepViewImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepViewImplFromJson(json);

  @override
  final String? code;
  @override
  final int? step;
  @override
  final String? title;
  final List<Step>? _steps;
  @override
  List<Step>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Recommend>? _unionRecommends;
  @override
  @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
  List<Recommend>? get unionRecommends {
    final value = _unionRecommends;
    if (value == null) return null;
    if (_unionRecommends is EqualUnmodifiableListView) return _unionRecommends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StepView(code: $code, step: $step, title: $title, steps: $steps, unionRecommends: $unionRecommends)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepViewImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            const DeepCollectionEquality()
                .equals(other._unionRecommends, _unionRecommends));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      step,
      title,
      const DeepCollectionEquality().hash(_steps),
      const DeepCollectionEquality().hash(_unionRecommends));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepViewImplCopyWith<_$StepViewImpl> get copyWith =>
      __$$StepViewImplCopyWithImpl<_$StepViewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepViewImplToJson(
      this,
    );
  }
}

abstract class _StepView implements StepView {
  const factory _StepView(
      {final String? code,
      final int? step,
      final String? title,
      final List<Step>? steps,
      @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
      final List<Recommend>? unionRecommends}) = _$StepViewImpl;

  factory _StepView.fromJson(Map<String, dynamic> json) =
      _$StepViewImpl.fromJson;

  @override
  String? get code;
  @override
  int? get step;
  @override
  String? get title;
  @override
  List<Step>? get steps;
  @override
  @JsonKey(name: Keys.STEP_VIEW_UNION_RECOMMENDS)
  List<Recommend>? get unionRecommends;
  @override
  @JsonKey(ignore: true)
  _$$StepViewImplCopyWith<_$StepViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
