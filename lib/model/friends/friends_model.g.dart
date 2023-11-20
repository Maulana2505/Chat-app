// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friend _$FriendFromJson(Map<String, dynamic> json) => Friend(
      id: json['id'] as String,
      userid: json['userid'] as String,
      friendid: json['friendid'] as String,
      friend: Friends.fromJson(json['friend'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FriendToJson(Friend instance) => <String, dynamic>{
      'id': instance.id,
      'userid': instance.userid,
      'friendid': instance.friendid,
      'friend': instance.friend.toJson(),
    };

Friends _$FriendsFromJson(Map<String, dynamic> json) => Friends(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      imgprofile: json['imgprofile'] as String?,
    );

Map<String, dynamic> _$FriendsToJson(Friends instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'imgprofile': instance.imgprofile,
    };
