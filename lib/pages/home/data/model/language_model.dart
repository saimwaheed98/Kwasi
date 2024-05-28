import 'package:freezed_annotation/freezed_annotation.dart';
part "language_model.freezed.dart";
part "language_model.g.dart";

@Freezed()
class LanguageModel with _$LanguageModel {
  const factory LanguageModel({
    @Default("") String english,
    @Default("") String french,
    @Default("") String duala,
    @Default("") String ghomla,
    @Default("") String bulu,
    @Default("") String dualaVoiceUrl,
    @Default("") String buluVoiceUrl,
    @Default("") String ghomalaVoiceUrls,
  }) = _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}
