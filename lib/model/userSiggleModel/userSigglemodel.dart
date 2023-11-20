import 'package:json_annotation/json_annotation.dart';
part 'userSigglemodel.g.dart';
@JsonSerializable()
class userSigglemodel {
  late String id;
  late String username;
  late String email;
  late String password;
  String? imgprofile;
  userSigglemodel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.imgprofile,
  });
  factory userSigglemodel.fromJson(Map<String, dynamic> data) =>
      _$userSigglemodelFromJson(data);
  Map<String, dynamic> toJson() => _$userSigglemodelToJson(this);
}