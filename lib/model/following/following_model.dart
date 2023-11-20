import 'package:json_annotation/json_annotation.dart';

part 'following_model.g.dart';

@JsonSerializable()
class Following {
  late String id;
  late String followingId;
  late String username;
  String? imgprofile;
  late String userId;
  Following({
    required this.id,
    required this.followingId,
    required this.username,
    required this.imgprofile,
    required this.userId,
  });

  factory Following.fromJson(Map<String, dynamic> data) => _$FollowingFromJson(data);
  Map<String, dynamic> toJson() => _$FollowingToJson(this);
}