import 'package:freezed_annotation/freezed_annotation.dart';
part "learning_words_model.freezed.dart";
part "learning_words_model.g.dart";

@Freezed()
class LearningWordsModel with _$LearningWordsModel{
  const factory LearningWordsModel({
  @Default("")  String english,
  @Default("")  String french,
  @Default("")  String duala,
  @Default("")  String ghomala,
  @Default("")  String bulu,
  @Default("")  String basaa,
  }) = _LearningWordsModel;

 factory LearningWordsModel.fromJson(Map<String,dynamic> json) => _$LearningWordsModelFromJson(json);
}