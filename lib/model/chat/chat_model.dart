import 'package:json_annotation/json_annotation.dart';
part 'chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Chat {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "username")
  String username;
  @JsonKey(name: "friends")
  List<FriendElement> friends;

  Chat({
    required this.id,
    required this.username,
    required this.friends,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FriendElement {
  @JsonKey(name: "userid")
  String userid;
  @JsonKey(name: "friendid")
  String friendid;
  @JsonKey(name: "friend")
  FriendFriend friend;
  @JsonKey(name: "chats")
  List<ChatElement> chats;

  FriendElement({
    required this.userid,
    required this.friendid,
    required this.friend,
    required this.chats,
  });

  factory FriendElement.fromJson(Map<String, dynamic> json) =>
      _$FriendElementFromJson(json);

  Map<String, dynamic> toJson() => _$FriendElementToJson(this);
}

@JsonSerializable()
class ChatElement {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "senderid")
  String senderid;
  @JsonKey(name: "receiverid")
  String receiverid;
  @JsonKey(name: "massage")
  String massage;
  @JsonKey(name: "createdAt")
  DateTime createdAt;
  @JsonKey(name: "updatedAt")
  DateTime updatedAt;

  ChatElement({
    required this.id,
    required this.senderid,
    required this.receiverid,
    required this.massage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatElement.fromJson(Map<String, dynamic> json) =>
      _$ChatElementFromJson(json);

  Map<String, dynamic> toJson() => _$ChatElementToJson(this);
}

@JsonSerializable()
class FriendFriend {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "username")
  String username;

  FriendFriend({
    required this.id,
    required this.username,
  });

  factory FriendFriend.fromJson(Map<String, dynamic> json) =>
      _$FriendFriendFromJson(json);

  Map<String, dynamic> toJson() => _$FriendFriendToJson(this);
}
