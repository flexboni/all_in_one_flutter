// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Step _$StepFromJson(Map<String, dynamic> json) {
  return _Step.fromJson(json);
}

/// @nodoc
mixin _$Step {
  String? get code => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get step => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.STEPS_URL_LOTTIE)
  String? get urlLottie => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.STEPS_URL_MP3)
  String? get urlMp3 => throw _privateConstructorUsedError;
  List<Recommend>? get recommends => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW)
  String? get contentStepview => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCopyWith<Step> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) then) =
      _$StepCopyWithImpl<$Res, Step>;
  @useResult
  $Res call(
      {String? code,
      String? title,
      int? step,
      @JsonKey(name: Keys.STEPS_URL_LOTTIE) String? urlLottie,
      @JsonKey(name: Keys.STEPS_URL_MP3) String? urlMp3,
      List<Recommend>? recommends,
      @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW) String? contentStepview});
}

/// @nodoc
class _$StepCopyWithImpl<$Res, $Val extends Step>
    implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? step = freezed,
    Object? urlLottie = freezed,
    Object? urlMp3 = freezed,
    Object? recommends = freezed,
    Object? contentStepview = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      urlLottie: freezed == urlLottie
          ? _value.urlLottie
          : urlLottie // ignore: cast_nullable_to_non_nullable
              as String?,
      urlMp3: freezed == urlMp3
          ? _value.urlMp3
          : urlMp3 // ignore: cast_nullable_to_non_nullable
              as String?,
      recommends: freezed == recommends
          ? _value.recommends
          : recommends // ignore: cast_nullable_to_non_nullable
              as List<Recommend>?,
      contentStepview: freezed == contentStepview
          ? _value.contentStepview
          : contentStepview // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepImplCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$$StepImplCopyWith(
          _$StepImpl value, $Res Function(_$StepImpl) then) =
      __$$StepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      String? title,
      int? step,
      @JsonKey(name: Keys.STEPS_URL_LOTTIE) String? urlLottie,
      @JsonKey(name: Keys.STEPS_URL_MP3) String? urlMp3,
      List<Recommend>? recommends,
      @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW) String? contentStepview});
}

/// @nodoc
class __$$StepImplCopyWithImpl<$Res>
    extends _$StepCopyWithImpl<$Res, _$StepImpl>
    implements _$$StepImplCopyWith<$Res> {
  __$$StepImplCopyWithImpl(_$StepImpl _value, $Res Function(_$StepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? title = freezed,
    Object? step = freezed,
    Object? urlLottie = freezed,
    Object? urlMp3 = freezed,
    Object? recommends = freezed,
    Object? contentStepview = freezed,
  }) {
    return _then(_$StepImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      step: freezed == step
          ? _value.step
          : step // ignore: cast_nullable_to_non_nullable
              as int?,
      urlLottie: freezed == urlLottie
          ? _value.urlLottie
          : urlLottie // ignore: cast_nullable_to_non_nullable
              as String?,
      urlMp3: freezed == urlMp3
          ? _value.urlMp3
          : urlMp3 // ignore: cast_nullable_to_non_nullable
              as String?,
      recommends: freezed == recommends
          ? _value._recommends
          : recommends // ignore: cast_nullable_to_non_nullable
              as List<Recommend>?,
      contentStepview: freezed == contentStepview
          ? _value.contentStepview
          : contentStepview // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepImpl implements _Step {
  const _$StepImpl(
      {this.code,
      this.title,
      this.step,
      @JsonKey(name: Keys.STEPS_URL_LOTTIE) this.urlLottie,
      @JsonKey(name: Keys.STEPS_URL_MP3) this.urlMp3,
      final List<Recommend>? recommends,
      @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW) this.contentStepview})
      : _recommends = recommends;

  factory _$StepImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepImplFromJson(json);

  @override
  final String? code;
  @override
  final String? title;
  @override
  final int? step;
  @override
  @JsonKey(name: Keys.STEPS_URL_LOTTIE)
  final String? urlLottie;
  @override
  @JsonKey(name: Keys.STEPS_URL_MP3)
  final String? urlMp3;
  final List<Recommend>? _recommends;
  @override
  List<Recommend>? get recommends {
    final value = _recommends;
    if (value == null) return null;
    if (_recommends is EqualUnmodifiableListView) return _recommends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW)
  final String? contentStepview;

  @override
  String toString() {
    return 'Step(code: $code, title: $title, step: $step, urlLottie: $urlLottie, urlMp3: $urlMp3, recommends: $recommends, contentStepview: $contentStepview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.urlLottie, urlLottie) ||
                other.urlLottie == urlLottie) &&
            (identical(other.urlMp3, urlMp3) || other.urlMp3 == urlMp3) &&
            const DeepCollectionEquality()
                .equals(other._recommends, _recommends) &&
            (identical(other.contentStepview, contentStepview) ||
                other.contentStepview == contentStepview));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      title,
      step,
      urlLottie,
      urlMp3,
      const DeepCollectionEquality().hash(_recommends),
      contentStepview);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepImplCopyWith<_$StepImpl> get copyWith =>
      __$$StepImplCopyWithImpl<_$StepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepImplToJson(
      this,
    );
  }
}

abstract class _Step implements Step {
  const factory _Step(
      {final String? code,
      final String? title,
      final int? step,
      @JsonKey(name: Keys.STEPS_URL_LOTTIE) final String? urlLottie,
      @JsonKey(name: Keys.STEPS_URL_MP3) final String? urlMp3,
      final List<Recommend>? recommends,
      @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW)
      final String? contentStepview}) = _$StepImpl;

  factory _Step.fromJson(Map<String, dynamic> json) = _$StepImpl.fromJson;

  @override
  String? get code;
  @override
  String? get title;
  @override
  int? get step;
  @override
  @JsonKey(name: Keys.STEPS_URL_LOTTIE)
  String? get urlLottie;
  @override
  @JsonKey(name: Keys.STEPS_URL_MP3)
  String? get urlMp3;
  @override
  List<Recommend>? get recommends;
  @override
  @JsonKey(name: Keys.STEPS_CONTENT_STEP_VIEW)
  String? get contentStepview;
  @override
  @JsonKey(ignore: true)
  _$$StepImplCopyWith<_$StepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
