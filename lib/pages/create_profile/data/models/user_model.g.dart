// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDetailImpl _$$UserDetailImplFromJson(Map<String, dynamic> json) =>
    _$UserDetailImpl(
      username: json['username'] as String? ?? '',
      userAge: json['userAge'] as String? ?? '',
      userGender: json['userGender'] as String? ?? '',
      uid: json['uid'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      pushToken: json['pushToken'] as String? ?? '',
      email: json['email'] as String? ?? '',
      photoURL: json['photoURL'] as String? ?? "",
      wantToLearn: json['wantToLearn'] as String? ?? "",
      interestedIn: json['interestedIn'] as String? ?? "",
    );

Map<String, dynamic> _$$UserDetailImplToJson(_$UserDetailImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userAge': instance.userAge,
      'userGender': instance.userGender,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'pushToken': instance.pushToken,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'wantToLearn': instance.wantToLearn,
      'interestedIn': instance.interestedIn,
    };
