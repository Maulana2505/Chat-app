// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendreq_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friendrequest _$FriendrequestFromJson(Map<String, dynamic> json) =>
    Friendrequest(
      id: json['id'] as String,
      userid: json['userid'] as String,
      friendreqid: json['friendreqid'] as String,
      friendreq: Friendreq.fromJson(json['friendreq'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendrequestToJson(Friendrequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'friendreqid': instance.friendreqid,
      'friendreq': instance.friendreq.toJson(),
    };

Friendreq _$FriendreqFromJson(Map<String, dynamic> json) => Friendreq(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      imgprofile: json['imgprofile'] as String?,
    );

Map<String, dynamic> _$FriendreqToJson(Friendreq instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'imgprofile': instance.imgprofile,
    };
