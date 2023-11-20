
import 'package:json_annotation/json_annotation.dart';
part 'pending_data.g.dart';

@JsonSerializable(explicitToJson: true)
class Pending {
  String id;
  String userid;
  String friendid;
  Pendings pendings;
  Pending(
      {
      required this.id,
      required this.userid,
      required this.friendid,
      required this.pendings});
  factory Pending.fromJson(Map<String, dynamic> data) =>
      _$PendingFromJson(data);
  Map<String, dynamic> toJson() => _$PendingToJson(this);
}

@JsonSerializable()
class Pendings {
  String id;
  String username;
  String email;
  String? imgprofile;
  Pendings({
    required this.id,
    required this.email,
    required this.username,
    required this.imgprofile,
  });
  factory Pendings.fromJson(Map<String, dynamic> data) =>
      _$PendingsFromJson(data);
  Map<String, dynamic> toJson() => _$PendingsToJson(this);
}
