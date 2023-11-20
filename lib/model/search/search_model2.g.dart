// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchM2 _$SearchM2FromJson(Map<String, dynamic> json) => SearchM2(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imgprofile: json['imgprofile'] as String?,
      friends: (json['friends'] as List<dynamic>)
          .map((e) => Freind.fromJson(e as Map<String, dynamic>))
          .toList(),
      friendrequests: (json['friendrequests'] as List<dynamic>)
          .map((e) => Freindreq.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendings: (json['pendings'] as List<dynamic>)
          .map((e) => Pending.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchM2ToJson(SearchM2 instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'imgprofile': instance.imgprofile,
      'friends': instance.friends.map((e) => e.toJson()).toList(),
      'friendrequests': instance.friendrequests.map((e) => e.toJson()).toList(),
      'pendings': instance.pendings.map((e) => e.toJson()).toList(),
    };

Freind _$FreindFromJson(Map<String, dynamic> json) => Freind(
      json['id'] as String,
      json['userid'] as String,
      json['friendid'] as String,
    );

Map<String, dynamic> _$FreindToJson(Freind instance) => <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'friendid': instance.friendid,
    };

Freindreq _$FreindreqFromJson(Map<String, dynamic> json) => Freindreq(
      json['id'] as String,
      json['userid'] as String,
      json['friendreqid'] as String,
    );

Map<String, dynamic> _$FreindreqToJson(Freindreq instance) => <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'friendreqid': instance.friendreqid,
    };

Pending _$PendingFromJson(Map<String, dynamic> json) => Pending(
      json['id'] as String,
      json['userid'] as String,
      json['friendid'] as String,
    );

Map<String, dynamic> _$PendingToJson(Pending instance) => <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'friendid': instance.friendid,
    };
