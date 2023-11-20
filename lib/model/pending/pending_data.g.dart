// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pending _$PendingFromJson(Map<String, dynamic> json) => Pending(
      id: json['id'] as String,
      userid: json['userid'] as String,
      friendid: json['friendid'] as String,
      pendings: Pendings.fromJson(json['pendings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PendingToJson(Pending instance) => <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'friendid': instance.friendid,
      'pendings': instance.pendings.toJson(),
    };

Pendings _$PendingsFromJson(Map<String, dynamic> json) => Pendings(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      imgprofile: json['imgprofile'] as String?,
    );

Map<String, dynamic> _$PendingsToJson(Pendings instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'imgprofile': instance.imgprofile,
    };
