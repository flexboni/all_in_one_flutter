// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lecture _$LectureFromJson(Map<String, dynamic> json) {
  return _Lecture.fromJson(json);
}

/// @nodoc
mixin _$Lecture {
  String get title => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURE_TITLE_NAV)
  String? get titleNav => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURE_IS_ACTIVE)
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL)
  String? get urlThumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURES_TYPE_LECTURE)
  String? get typeLecture => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.URL_VIDEO)
  String? get urlVideo => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURES_URL_VIDEO_1)
  String? get urlVideo1 => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURES_URL_VIDEO_2)
  String? get urlVideo2 => throw _privateConstructorUsedError;
  String? get questions => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
  List<Question>? get questionsInfo => throw _privateConstructorUsedError;
  @JsonKey(name: Keys.LECTURE_CREATED_AT)
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LectureCopyWith<Lecture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureCopyWith<$Res> {
  factory $LectureCopyWith(Lecture value, $Res Function(Lecture) then) =
      _$LectureCopyWithImpl<$Res, Lecture>;
  @useResult
  $Res call(
      {String title,
      String code,
      String? type,
      @JsonKey(name: Keys.LECTURE_TITLE_NAV) String? titleNav,
      @JsonKey(name: Keys.LECTURE_IS_ACTIVE) bool? isActive,
      @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL) String? urlThumbnail,
      @JsonKey(name: Keys.LECTURES_TYPE_LECTURE) String? typeLecture,
      @JsonKey(name: Keys.URL_VIDEO) String? urlVideo,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_1) String? urlVideo1,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_2) String? urlVideo2,
      String? questions,
      @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
      List<Question>? questionsInfo,
      @JsonKey(name: Keys.LECTURE_CREATED_AT) String? createdAt});
}

/// @nodoc
class _$LectureCopyWithImpl<$Res, $Val extends Lecture>
    implements $LectureCopyWith<$Res> {
  _$LectureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? code = null,
    Object? type = freezed,
    Object? titleNav = freezed,
    Object? isActive = freezed,
    Object? urlThumbnail = freezed,
    Object? typeLecture = freezed,
    Object? urlVideo = freezed,
    Object? urlVideo1 = freezed,
    Object? urlVideo2 = freezed,
    Object? questions = freezed,
    Object? questionsInfo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      titleNav: freezed == titleNav
          ? _value.titleNav
          : titleNav // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      urlThumbnail: freezed == urlThumbnail
          ? _value.urlThumbnail
          : urlThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      typeLecture: freezed == typeLecture
          ? _value.typeLecture
          : typeLecture // ignore: cast_nullable_to_non_nullable
              as String?,
      urlVideo: freezed == urlVideo
          ? _value.urlVideo
          : urlVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      urlVideo1: freezed == urlVideo1
          ? _value.urlVideo1
          : urlVideo1 // ignore: cast_nullable_to_non_nullable
              as String?,
      urlVideo2: freezed == urlVideo2
          ? _value.urlVideo2
          : urlVideo2 // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as String?,
      questionsInfo: freezed == questionsInfo
          ? _value.questionsInfo
          : questionsInfo // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LectureImplCopyWith<$Res> implements $LectureCopyWith<$Res> {
  factory _$$LectureImplCopyWith(
          _$LectureImpl value, $Res Function(_$LectureImpl) then) =
      __$$LectureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String code,
      String? type,
      @JsonKey(name: Keys.LECTURE_TITLE_NAV) String? titleNav,
      @JsonKey(name: Keys.LECTURE_IS_ACTIVE) bool? isActive,
      @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL) String? urlThumbnail,
      @JsonKey(name: Keys.LECTURES_TYPE_LECTURE) String? typeLecture,
      @JsonKey(name: Keys.URL_VIDEO) String? urlVideo,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_1) String? urlVideo1,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_2) String? urlVideo2,
      String? questions,
      @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
      List<Question>? questionsInfo,
      @JsonKey(name: Keys.LECTURE_CREATED_AT) String? createdAt});
}

/// @nodoc
class __$$LectureImplCopyWithImpl<$Res>
    extends _$LectureCopyWithImpl<$Res, _$LectureImpl>
    implements _$$LectureImplCopyWith<$Res> {
  __$$LectureImplCopyWithImpl(
      _$LectureImpl _value, $Res Function(_$LectureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? code = null,
    Object? type = freezed,
    Object? titleNav = freezed,
    Object? isActive = freezed,
    Object? urlThumbnail = freezed,
    Object? typeLecture = freezed,
    Object? urlVideo = freezed,
    Object? urlVideo1 = freezed,
    Object? urlVideo2 = freezed,
    Object? questions = freezed,
    Object? questionsInfo = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$LectureImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      titleNav: freezed == titleNav
          ? _value.titleNav
          : titleNav // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      urlThumbnail: freezed == urlThumbnail
          ? _value.urlThumbnail
          : urlThumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      typeLecture: freezed == typeLecture
          ? _value.typeLecture
          : typeLecture // ignore: cast_nullable_to_non_nullable
              as String?,
      urlVideo: freezed == urlVideo
          ? _value.urlVideo
          : urlVideo // ignore: cast_nullable_to_non_nullable
              as String?,
      urlVideo1: freezed == urlVideo1
          ? _value.urlVideo1
          : urlVideo1 // ignore: cast_nullable_to_non_nullable
              as String?,
      urlVideo2: freezed == urlVideo2
          ? _value.urlVideo2
          : urlVideo2 // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: freezed == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as String?,
      questionsInfo: freezed == questionsInfo
          ? _value._questionsInfo
          : questionsInfo // ignore: cast_nullable_to_non_nullable
              as List<Question>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LectureImpl implements _Lecture {
  const _$LectureImpl(
      {required this.title,
      required this.code,
      this.type,
      @JsonKey(name: Keys.LECTURE_TITLE_NAV) this.titleNav,
      @JsonKey(name: Keys.LECTURE_IS_ACTIVE) this.isActive,
      @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL) this.urlThumbnail,
      @JsonKey(name: Keys.LECTURES_TYPE_LECTURE) this.typeLecture,
      @JsonKey(name: Keys.URL_VIDEO) this.urlVideo,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_1) this.urlVideo1,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_2) this.urlVideo2,
      this.questions,
      @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
      final List<Question>? questionsInfo,
      @JsonKey(name: Keys.LECTURE_CREATED_AT) this.createdAt})
      : _questionsInfo = questionsInfo;

  factory _$LectureImpl.fromJson(Map<String, dynamic> json) =>
      _$$LectureImplFromJson(json);

  @override
  final String title;
  @override
  final String code;
  @override
  final String? type;
  @override
  @JsonKey(name: Keys.LECTURE_TITLE_NAV)
  final String? titleNav;
  @override
  @JsonKey(name: Keys.LECTURE_IS_ACTIVE)
  final bool? isActive;
  @override
  @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL)
  final String? urlThumbnail;
  @override
  @JsonKey(name: Keys.LECTURES_TYPE_LECTURE)
  final String? typeLecture;
  @override
  @JsonKey(name: Keys.URL_VIDEO)
  final String? urlVideo;
  @override
  @JsonKey(name: Keys.LECTURES_URL_VIDEO_1)
  final String? urlVideo1;
  @override
  @JsonKey(name: Keys.LECTURES_URL_VIDEO_2)
  final String? urlVideo2;
  @override
  final String? questions;
  final List<Question>? _questionsInfo;
  @override
  @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
  List<Question>? get questionsInfo {
    final value = _questionsInfo;
    if (value == null) return null;
    if (_questionsInfo is EqualUnmodifiableListView) return _questionsInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: Keys.LECTURE_CREATED_AT)
  final String? createdAt;

  @override
  String toString() {
    return 'Lecture(title: $title, code: $code, type: $type, titleNav: $titleNav, isActive: $isActive, urlThumbnail: $urlThumbnail, typeLecture: $typeLecture, urlVideo: $urlVideo, urlVideo1: $urlVideo1, urlVideo2: $urlVideo2, questions: $questions, questionsInfo: $questionsInfo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LectureImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.titleNav, titleNav) ||
                other.titleNav == titleNav) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.urlThumbnail, urlThumbnail) ||
                other.urlThumbnail == urlThumbnail) &&
            (identical(other.typeLecture, typeLecture) ||
                other.typeLecture == typeLecture) &&
            (identical(other.urlVideo, urlVideo) ||
                other.urlVideo == urlVideo) &&
            (identical(other.urlVideo1, urlVideo1) ||
                other.urlVideo1 == urlVideo1) &&
            (identical(other.urlVideo2, urlVideo2) ||
                other.urlVideo2 == urlVideo2) &&
            (identical(other.questions, questions) ||
                other.questions == questions) &&
            const DeepCollectionEquality()
                .equals(other._questionsInfo, _questionsInfo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      code,
      type,
      titleNav,
      isActive,
      urlThumbnail,
      typeLecture,
      urlVideo,
      urlVideo1,
      urlVideo2,
      questions,
      const DeepCollectionEquality().hash(_questionsInfo),
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LectureImplCopyWith<_$LectureImpl> get copyWith =>
      __$$LectureImplCopyWithImpl<_$LectureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LectureImplToJson(
      this,
    );
  }
}

abstract class _Lecture implements Lecture {
  const factory _Lecture(
      {required final String title,
      required final String code,
      final String? type,
      @JsonKey(name: Keys.LECTURE_TITLE_NAV) final String? titleNav,
      @JsonKey(name: Keys.LECTURE_IS_ACTIVE) final bool? isActive,
      @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL) final String? urlThumbnail,
      @JsonKey(name: Keys.LECTURES_TYPE_LECTURE) final String? typeLecture,
      @JsonKey(name: Keys.URL_VIDEO) final String? urlVideo,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_1) final String? urlVideo1,
      @JsonKey(name: Keys.LECTURES_URL_VIDEO_2) final String? urlVideo2,
      final String? questions,
      @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
      final List<Question>? questionsInfo,
      @JsonKey(name: Keys.LECTURE_CREATED_AT)
      final String? createdAt}) = _$LectureImpl;

  factory _Lecture.fromJson(Map<String, dynamic> json) = _$LectureImpl.fromJson;

  @override
  String get title;
  @override
  String get code;
  @override
  String? get type;
  @override
  @JsonKey(name: Keys.LECTURE_TITLE_NAV)
  String? get titleNav;
  @override
  @JsonKey(name: Keys.LECTURE_IS_ACTIVE)
  bool? get isActive;
  @override
  @JsonKey(name: Keys.LECTURES_URL_THUMBNAIL)
  String? get urlThumbnail;
  @override
  @JsonKey(name: Keys.LECTURES_TYPE_LECTURE)
  String? get typeLecture;
  @override
  @JsonKey(name: Keys.URL_VIDEO)
  String? get urlVideo;
  @override
  @JsonKey(name: Keys.LECTURES_URL_VIDEO_1)
  String? get urlVideo1;
  @override
  @JsonKey(name: Keys.LECTURES_URL_VIDEO_2)
  String? get urlVideo2;
  @override
  String? get questions;
  @override
  @JsonKey(name: Keys.LECTURES_QUESTIONS_INFO)
  List<Question>? get questionsInfo;
  @override
  @JsonKey(name: Keys.LECTURE_CREATED_AT)
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$LectureImplCopyWith<_$LectureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
