import 'package:json_annotation/json_annotation.dart';

part 'follow_model.g.dart';

@JsonSerializable()
class Follow {
  late String id;
  late String followId;
  late String username;
  String? imgprofile;
  late String userId;
  Follow({
    required this.id,
    required this.followId,
    required this.username,
    required this.imgprofile,
    required this.userId,
  });

  factory Follow.fromJson(Map<String, dynamic> data) => _$FollowFromJson(data);
  Map<String, dynamic> toJson() => _$FollowToJson(this);
}
