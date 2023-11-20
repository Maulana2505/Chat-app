import 'package:json_annotation/json_annotation.dart';
part 'friends_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Friend {
  String id;
  String userid;
  String friendid;
  Friends friend;
  Friend({
    required this.id,
    required this.userid,
    required this.friendid,
    required this.friend
  });
  factory Friend.fromJson(Map<String, dynamic> data) =>
      _$FriendFromJson(data);
  Map<String, dynamic> toJson() => _$FriendToJson(this);
}

@JsonSerializable()
class Friends{
  String id;
  String username;
  String email;
  String? imgprofile;
  Friends({
    required this.id,
    required this.email,
    required this.username,
    required this.imgprofile,
  });
  factory Friends.fromJson(Map<String, dynamic> data) =>
      _$FriendsFromJson(data);
  Map<String, dynamic> toJson() => _$FriendsToJson(this);
}