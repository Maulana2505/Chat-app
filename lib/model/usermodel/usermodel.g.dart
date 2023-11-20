// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

usermodel _$usermodelFromJson(Map<String, dynamic> json) => usermodel(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      imgprofile: json['imgprofile'] as String?,
      post: (json['post'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      following: (json['following'] as List<dynamic>)
          .map((e) => Following.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$usermodelToJson(usermodel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'imgprofile': instance.imgprofile,
      'post': instance.post.map((e) => e.toJson()).toList(),
      'following': instance.following.map((e) => e.toJson()).toList(),
    };
