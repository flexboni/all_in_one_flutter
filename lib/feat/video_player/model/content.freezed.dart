// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  String get title => throw _privateConstructorUsedError;
  String get structure => throw _privateConstructorUsedError;
  ContentType get type => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURE_TYPE)
  String get lectureType => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.URL_VIDEO)
  String get urlVideo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {String title,
      String structure,
      ContentType type,
      @JsonKey(name: Keys.LECTURE_TYPE) String lectureType,
      @JsonKey(name: Keys.URL_VIDEO) String urlVideo});
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? structure = null,
    Object? type = null,
    Object? lectureType = null,
    Object? urlVideo = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      structure: null == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      lectureType: null == lectureType
          ? _value.lectureType
          : lectureType // ignore: cast_nullable_to_non_nullable
              as String,
      urlVideo: null == urlVideo
          ? _value.urlVideo
          : urlVideo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String structure,
      ContentType type,
      @JsonKey(name: Keys.LECTURE_TYPE) String lectureType,
      @JsonKey(name: Keys.URL_VIDEO) String urlVideo});
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? structure = null,
    Object? type = null,
    Object? lectureType = null,
    Object? urlVideo = null,
  }) {
    return _then(_$ContentImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      structure: null == structure
          ? _value.structure
          : structure // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      lectureType: null == lectureType
          ? _value.lectureType
          : lectureType // ignore: cast_nullable_to_non_nullable
              as String,
      urlVideo: null == urlVideo
          ? _value.urlVideo
          : urlVideo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl implements _Content {
  const _$ContentImpl(
      {required this.title,
      required this.structure,
      required this.type,
      @JsonKey(name: Keys.LECTURE_TYPE) required this.lectureType,
      @JsonKey(name: Keys.URL_VIDEO) required this.urlVideo});

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  @override
  final String title;
  @override
  final String structure;
  @override
  final ContentType type;
  @override
  @JsonKey(name: Keys.LECTURE_TYPE)
  final String lectureType;
  @override
  @JsonKey(name: Keys.URL_VIDEO)
  final String urlVideo;

  @override
  String toString() {
    return 'Content(title: $title, structure: $structure, type: $type, lectureType: $lectureType, urlVideo: $urlVideo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.structure, structure) ||
                other.structure == structure) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lectureType, lectureType) ||
                other.lectureType == lectureType) &&
            (identical(other.urlVideo, urlVideo) ||
                other.urlVideo == urlVideo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, structure, type, lectureType, urlVideo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  const factory _Content(
          {required final String title,
          required final String structure,
          required final ContentType type,
          @JsonKey(name: Keys.LECTURE_TYPE) required final String lectureType,
          @JsonKey(name: Keys.URL_VIDEO) required final String urlVideo}) =
      _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  String get title;
  @override
  String get structure;
  @override
  ContentType get type;
  @override
  @JsonKey(name: Keys.LECTURE_TYPE)
  String get lectureType;
  @override
  @JsonKey(name: Keys.URL_VIDEO)
  String get urlVideo;
  @override
  @JsonKey(ignore: true)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
