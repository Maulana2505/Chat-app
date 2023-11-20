// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Following _$FollowingFromJson(Map<String, dynamic> json) => Following(
      id: json['id'] as String,
      followingId: json['followingId'] as String,
      username: json['username'] as String,
      imgprofile: json['imgprofile'] as String?,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$FollowingToJson(Following instance) => <String, dynamic>{
      'id': instance.id,
      'followingId': instance.followingId,
      'username': instance.username,
      'imgprofile': instance.imgprofile,
      'userId': instance.userId,
    };
