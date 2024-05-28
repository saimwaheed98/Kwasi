import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserDetail with _$UserDetail {
  const factory UserDetail({
    @Default('') String username,
    @Default('') String userAge,
    @Default('') String userGender,
    @Default('') String uid,
    @Default('') String createdAt,
    @Default('') String pushToken,
    @Default('') String email,
    @Default("") String photoURL,
    @Default("") String wantToLearn,
    @Default("") String interestedIn,
  }) = _UserDetail;

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
}
