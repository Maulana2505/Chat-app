
import 'package:json_annotation/json_annotation.dart';
part 'friendreq_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Friendrequest {
  String id;
  String userid;
  String friendreqid;
  Friendreq friendreq;
  Friendrequest({
      required this.id,
      required this.userid,
      required this.friendreqid,
      required this.friendreq});
  factory Friendrequest.fromJson(Map<String, dynamic> data) =>
      _$FriendrequestFromJson(data);
  Map<String, dynamic> toJson() => _$FriendrequestToJson(this);
}

@JsonSerializable()
class Friendreq {
  String id;
  String username;
  String email;
  String? imgprofile;
  Friendreq({
    required this.id,
    required this.email,
    required this.username,
    required this.imgprofile,
  });
  factory Friendreq.fromJson(Map<String, dynamic> data) =>
      _$FriendreqFromJson(data);
  Map<String, dynamic> toJson() => _$FriendreqToJson(this);
}
