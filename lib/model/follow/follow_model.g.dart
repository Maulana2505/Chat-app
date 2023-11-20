// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Follow _$FollowFromJson(Map<String, dynamic> json) => Follow(
      id: json['id'] as String,
      followId: json['followId'] as String,
      username: json['username'] as String,
      imgprofile: json['imgprofile'] as String?,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$FollowToJson(Follow instance) => <String, dynamic>{
      'id': instance.id,
      'followId': instance.followId,
      'username': instance.username,
      'imgprofile': instance.imgprofile,
      'userId': instance.userId,
    };
