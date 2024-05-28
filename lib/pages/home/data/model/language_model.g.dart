// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LanguageModelImpl _$$LanguageModelImplFromJson(Map<String, dynamic> json) =>
    _$LanguageModelImpl(
      english: json['english'] as String? ?? "",
      french: json['french'] as String? ?? "",
      duala: json['duala'] as String? ?? "",
      ghomla: json['ghomla'] as String? ?? "",
      bulu: json['bulu'] as String? ?? "",
      dualaVoiceUrl: json['dualaVoiceUrl'] as String? ?? "",
      buluVoiceUrl: json['buluVoiceUrl'] as String? ?? "",
      ghomalaVoiceUrls: json['ghomalaVoiceUrls'] as String? ?? "",
    );

Map<String, dynamic> _$$LanguageModelImplToJson(_$LanguageModelImpl instance) =>
    <String, dynamic>{
      'english': instance.english,
      'french': instance.french,
      'duala': instance.duala,
      'ghomla': instance.ghomla,
      'bulu': instance.bulu,
      'dualaVoiceUrl': instance.dualaVoiceUrl,
      'buluVoiceUrl': instance.buluVoiceUrl,
      'ghomalaVoiceUrls': instance.ghomalaVoiceUrls,
    };
