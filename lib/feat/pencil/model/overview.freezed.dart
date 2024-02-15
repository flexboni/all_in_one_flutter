// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Overview _$OverviewFromJson(Map<String, dynamic> json) {
  return _Overview.fromJson(json);
}

/// @nodoc
mixin _$Overview {
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW)
  String? get urlPreview => throw _privateConstructorUsedError;
  List<Step>? get steps => throw _privateConstructorUsedError;
  Recommend? get recommend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverviewCopyWith<Overview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewCopyWith<$Res> {
  factory $OverviewCopyWith(Overview value, $Res Function(Overview) then) =
      _$OverviewCopyWithImpl<$Res, Overview>;
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW) String? urlPreview,
      List<Step>? steps,
      Recommend? recommend});

  $RecommendCopyWith<$Res>? get recommend;
}

/// @nodoc
class _$OverviewCopyWithImpl<$Res, $Val extends Overview>
    implements $OverviewCopyWith<$Res> {
  _$OverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? urlPreview = freezed,
    Object? steps = freezed,
    Object? recommend = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      urlPreview: freezed == urlPreview
          ? _value.urlPreview
          : urlPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      recommend: freezed == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as Recommend?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecommendCopyWith<$Res>? get recommend {
    if (_value.recommend == null) {
      return null;
    }

    return $RecommendCopyWith<$Res>(_value.recommend!, (value) {
      return _then(_value.copyWith(recommend: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OverviewImplCopyWith<$Res>
    implements $OverviewCopyWith<$Res> {
  factory _$$OverviewImplCopyWith(
          _$OverviewImpl value, $Res Function(_$OverviewImpl) then) =
      __$$OverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW) String? urlPreview,
      List<Step>? steps,
      Recommend? recommend});

  @override
  $RecommendCopyWith<$Res>? get recommend;
}

/// @nodoc
class __$$OverviewImplCopyWithImpl<$Res>
    extends _$OverviewCopyWithImpl<$Res, _$OverviewImpl>
    implements _$$OverviewImplCopyWith<$Res> {
  __$$OverviewImplCopyWithImpl(
      _$OverviewImpl _value, $Res Function(_$OverviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? urlPreview = freezed,
    Object? steps = freezed,
    Object? recommend = freezed,
  }) {
    return _then(_$OverviewImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      urlPreview: freezed == urlPreview
          ? _value.urlPreview
          : urlPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Step>?,
      recommend: freezed == recommend
          ? _value.recommend
          : recommend // ignore: cast_nullable_to_non_nullable
              as Recommend?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OverviewImpl implements _Overview {
  const _$OverviewImpl(
      {this.code,
      @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW) this.urlPreview,
      final List<Step>? steps,
      this.recommend})
      : _steps = steps;

  factory _$OverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverviewImplFromJson(json);

  @override
  final String? code;
  @override
  @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW)
  final String? urlPreview;
  final List<Step>? _steps;
  @override
  List<Step>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Recommend? recommend;

  @override
  String toString() {
    return 'Overview(code: $code, urlPreview: $urlPreview, steps: $steps, recommend: $recommend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverviewImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.urlPreview, urlPreview) ||
                other.urlPreview == urlPreview) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.recommend, recommend) ||
                other.recommend == recommend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, urlPreview,
      const DeepCollectionEquality().hash(_steps), recommend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OverviewImplCopyWith<_$OverviewImpl> get copyWith =>
      __$$OverviewImplCopyWithImpl<_$OverviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OverviewImplToJson(
      this,
    );
  }
}

abstract class _Overview implements Overview {
  const factory _Overview(
      {final String? code,
      @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW) final String? urlPreview,
      final List<Step>? steps,
      final Recommend? recommend}) = _$OverviewImpl;

  factory _Overview.fromJson(Map<String, dynamic> json) =
      _$OverviewImpl.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(name: Keys.OVERVIEW_URL_PREVIEW)
  String? get urlPreview;
  @override
  List<Step>? get steps;
  @override
  Recommend? get recommend;
  @override
  @JsonKey(ignore: true)
  _$$OverviewImplCopyWith<_$OverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
