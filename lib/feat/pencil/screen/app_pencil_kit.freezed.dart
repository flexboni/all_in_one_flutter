// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_pencil_kit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DrawToolModel<T> {
  T get type => throw _privateConstructorUsedError;
  String get unselectedImage => throw _privateConstructorUsedError;
  String get selectedImage => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawToolModelCopyWith<T, DrawToolModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawToolModelCopyWith<T, $Res> {
  factory $DrawToolModelCopyWith(
          DrawToolModel<T> value, $Res Function(DrawToolModel<T>) then) =
      _$DrawToolModelCopyWithImpl<T, $Res, DrawToolModel<T>>;
  @useResult
  $Res call(
      {T type, String unselectedImage, String selectedImage, bool isSelected});
}

/// @nodoc
class _$DrawToolModelCopyWithImpl<T, $Res, $Val extends DrawToolModel<T>>
    implements $DrawToolModelCopyWith<T, $Res> {
  _$DrawToolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? unselectedImage = null,
    Object? selectedImage = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as T,
      unselectedImage: null == unselectedImage
          ? _value.unselectedImage
          : unselectedImage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedImage: null == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrawToolModelImplCopyWith<T, $Res>
    implements $DrawToolModelCopyWith<T, $Res> {
  factory _$$DrawToolModelImplCopyWith(_$DrawToolModelImpl<T> value,
          $Res Function(_$DrawToolModelImpl<T>) then) =
      __$$DrawToolModelImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {T type, String unselectedImage, String selectedImage, bool isSelected});
}

/// @nodoc
class __$$DrawToolModelImplCopyWithImpl<T, $Res>
    extends _$DrawToolModelCopyWithImpl<T, $Res, _$DrawToolModelImpl<T>>
    implements _$$DrawToolModelImplCopyWith<T, $Res> {
  __$$DrawToolModelImplCopyWithImpl(_$DrawToolModelImpl<T> _value,
      $Res Function(_$DrawToolModelImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? unselectedImage = null,
    Object? selectedImage = null,
    Object? isSelected = null,
  }) {
    return _then(_$DrawToolModelImpl<T>(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as T,
      unselectedImage: null == unselectedImage
          ? _value.unselectedImage
          : unselectedImage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedImage: null == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DrawToolModelImpl<T> implements _DrawToolModel<T> {
  const _$DrawToolModelImpl(
      {required this.type,
      required this.unselectedImage,
      required this.selectedImage,
      required this.isSelected});

  @override
  final T type;
  @override
  final String unselectedImage;
  @override
  final String selectedImage;
  @override
  final bool isSelected;

  @override
  String toString() {
    return 'DrawToolModel<$T>(type: $type, unselectedImage: $unselectedImage, selectedImage: $selectedImage, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawToolModelImpl<T> &&
            const DeepCollectionEquality().equals(other.type, type) &&
            (identical(other.unselectedImage, unselectedImage) ||
                other.unselectedImage == unselectedImage) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      unselectedImage,
      selectedImage,
      isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawToolModelImplCopyWith<T, _$DrawToolModelImpl<T>> get copyWith =>
      __$$DrawToolModelImplCopyWithImpl<T, _$DrawToolModelImpl<T>>(
          this, _$identity);
}

abstract class _DrawToolModel<T> implements DrawToolModel<T> {
  const factory _DrawToolModel(
      {required final T type,
      required final String unselectedImage,
      required final String selectedImage,
      required final bool isSelected}) = _$DrawToolModelImpl<T>;

  @override
  T get type;
  @override
  String get unselectedImage;
  @override
  String get selectedImage;
  @override
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$DrawToolModelImplCopyWith<T, _$DrawToolModelImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
