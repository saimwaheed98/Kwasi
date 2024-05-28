// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learning_words_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LearningWordsModel _$LearningWordsModelFromJson(Map<String, dynamic> json) {
  return _LearningWordsModel.fromJson(json);
}

/// @nodoc
mixin _$LearningWordsModel {
  String get english => throw _privateConstructorUsedError;
  String get french => throw _privateConstructorUsedError;
  String get duala => throw _privateConstructorUsedError;
  String get ghomala => throw _privateConstructorUsedError;
  String get bulu => throw _privateConstructorUsedError;
  String get basaa => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LearningWordsModelCopyWith<LearningWordsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LearningWordsModelCopyWith<$Res> {
  factory $LearningWordsModelCopyWith(
          LearningWordsModel value, $Res Function(LearningWordsModel) then) =
      _$LearningWordsModelCopyWithImpl<$Res, LearningWordsModel>;
  @useResult
  $Res call(
      {String english,
      String french,
      String duala,
      String ghomala,
      String bulu,
      String basaa});
}

/// @nodoc
class _$LearningWordsModelCopyWithImpl<$Res, $Val extends LearningWordsModel>
    implements $LearningWordsModelCopyWith<$Res> {
  _$LearningWordsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = null,
    Object? french = null,
    Object? duala = null,
    Object? ghomala = null,
    Object? bulu = null,
    Object? basaa = null,
  }) {
    return _then(_value.copyWith(
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      french: null == french
          ? _value.french
          : french // ignore: cast_nullable_to_non_nullable
              as String,
      duala: null == duala
          ? _value.duala
          : duala // ignore: cast_nullable_to_non_nullable
              as String,
      ghomala: null == ghomala
          ? _value.ghomala
          : ghomala // ignore: cast_nullable_to_non_nullable
              as String,
      bulu: null == bulu
          ? _value.bulu
          : bulu // ignore: cast_nullable_to_non_nullable
              as String,
      basaa: null == basaa
          ? _value.basaa
          : basaa // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LearningWordsModelImplCopyWith<$Res>
    implements $LearningWordsModelCopyWith<$Res> {
  factory _$$LearningWordsModelImplCopyWith(_$LearningWordsModelImpl value,
          $Res Function(_$LearningWordsModelImpl) then) =
      __$$LearningWordsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String english,
      String french,
      String duala,
      String ghomala,
      String bulu,
      String basaa});
}

/// @nodoc
class __$$LearningWordsModelImplCopyWithImpl<$Res>
    extends _$LearningWordsModelCopyWithImpl<$Res, _$LearningWordsModelImpl>
    implements _$$LearningWordsModelImplCopyWith<$Res> {
  __$$LearningWordsModelImplCopyWithImpl(_$LearningWordsModelImpl _value,
      $Res Function(_$LearningWordsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? english = null,
    Object? french = null,
    Object? duala = null,
    Object? ghomala = null,
    Object? bulu = null,
    Object? basaa = null,
  }) {
    return _then(_$LearningWordsModelImpl(
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      french: null == french
          ? _value.french
          : french // ignore: cast_nullable_to_non_nullable
              as String,
      duala: null == duala
          ? _value.duala
          : duala // ignore: cast_nullable_to_non_nullable
              as String,
      ghomala: null == ghomala
          ? _value.ghomala
          : ghomala // ignore: cast_nullable_to_non_nullable
              as String,
      bulu: null == bulu
          ? _value.bulu
          : bulu // ignore: cast_nullable_to_non_nullable
              as String,
      basaa: null == basaa
          ? _value.basaa
          : basaa // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LearningWordsModelImpl implements _LearningWordsModel {
  const _$LearningWordsModelImpl(
      {this.english = "",
      this.french = "",
      this.duala = "",
      this.ghomala = "",
      this.bulu = "",
      this.basaa = ""});

  factory _$LearningWordsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LearningWordsModelImplFromJson(json);

  @override
  @JsonKey()
  final String english;
  @override
  @JsonKey()
  final String french;
  @override
  @JsonKey()
  final String duala;
  @override
  @JsonKey()
  final String ghomala;
  @override
  @JsonKey()
  final String bulu;
  @override
  @JsonKey()
  final String basaa;

  @override
  String toString() {
    return 'LearningWordsModel(english: $english, french: $french, duala: $duala, ghomala: $ghomala, bulu: $bulu, basaa: $basaa)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LearningWordsModelImpl &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.french, french) || other.french == french) &&
            (identical(other.duala, duala) || other.duala == duala) &&
            (identical(other.ghomala, ghomala) || other.ghomala == ghomala) &&
            (identical(other.bulu, bulu) || other.bulu == bulu) &&
            (identical(other.basaa, basaa) || other.basaa == basaa));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, english, french, duala, ghomala, bulu, basaa);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LearningWordsModelImplCopyWith<_$LearningWordsModelImpl> get copyWith =>
      __$$LearningWordsModelImplCopyWithImpl<_$LearningWordsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LearningWordsModelImplToJson(
      this,
    );
  }
}

abstract class _LearningWordsModel implements LearningWordsModel {
  const factory _LearningWordsModel(
      {final String english,
      final String french,
      final String duala,
      final String ghomala,
      final String bulu,
      final String basaa}) = _$LearningWordsModelImpl;

  factory _LearningWordsModel.fromJson(Map<String, dynamic> json) =
      _$LearningWordsModelImpl.fromJson;

  @override
  String get english;
  @override
  String get french;
  @override
  String get duala;
  @override
  String get ghomala;
  @override
  String get bulu;
  @override
  String get basaa;
  @override
  @JsonKey(ignore: true)
  _$$LearningWordsModelImplCopyWith<_$LearningWordsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
