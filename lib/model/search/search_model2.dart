// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'search_model2.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchM2 {
  String id;
  String username;
  String email;
  String password;
  String? imgprofile;
  List<Freind> friends;
  List<Freindreq> friendrequests;
  List<Pending> pendings;
  SearchM2(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.imgprofile,
      required this.friends,
      required this.friendrequests,
      required this.pendings}); 
  factory SearchM2.fromJson(Map<String, dynamic> data) =>
      _$SearchM2FromJson(data);
  Map<String, dynamic> toJson() => _$SearchM2ToJson(this);
}

@JsonSerializable()
class Freind {
  String id;
  String userid;
  String friendid;
  Freind(
     this.id,
    this.userid,
     this.friendid,
  );
  factory Freind.fromJson(Map<String, dynamic> data) => _$FreindFromJson(data);
  Map<String, dynamic> toJson() => _$FreindToJson(this);
}

@JsonSerializable()
class Freindreq {
  String id;
  String userid;
  String friendreqid;
  Freindreq(
    this.id,
    this.userid,
    this.friendreqid,
  );
  factory Freindreq.fromJson(Map<String, dynamic> data) => _$FreindreqFromJson(data);
  Map<String, dynamic> toJson() => _$FreindreqToJson(this);
}

@JsonSerializable()
class Pending {
  String id;
  String userid;
  String friendid;
  Pending(
    this.id,
    this.userid,
    this.friendid,
  );
  factory Pending.fromJson(Map<String, dynamic> data) => _$PendingFromJson(data);
  Map<String, dynamic> toJson() => _$PendingToJson(this);
}