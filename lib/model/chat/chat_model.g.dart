// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      id: json['id'] as String,
      username: json['username'] as String,
      friends: (json['friends'] as List<dynamic>)
          .map((e) => FriendElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'friends': instance.friends.map((e) => e.toJson()).toList(),
    };

FriendElement _$FriendElementFromJson(Map<String, dynamic> json) =>
    FriendElement(
      userid: json['userid'] as String,
      friendid: json['friendid'] as String,
      friend: FriendFriend.fromJson(json['friend'] as Map<String, dynamic>),
      chats: (json['chats'] as List<dynamic>)
          .map((e) => ChatElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendElementToJson(FriendElement instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'friendid': instance.friendid,
      'friend': instance.friend.toJson(),
      'chats': instance.chats.map((e) => e.toJson()).toList(),
    };

ChatElement _$ChatElementFromJson(Map<String, dynamic> json) => ChatElement(
      id: json['id'] as String,
      senderid: json['senderid'] as String,
      receiverid: json['receiverid'] as String,
      massage: json['massage'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ChatElementToJson(ChatElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderid': instance.senderid,
      'receiverid': instance.receiverid,
      'massage': instance.massage,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

FriendFriend _$FriendFriendFromJson(Map<String, dynamic> json) => FriendFriend(
      id: json['id'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$FriendFriendToJson(FriendFriend instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };
