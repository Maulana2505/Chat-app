// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      imgpost: json['imgpost'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'imgpost': instance.imgpost,
      'description': instance.description,
      'userId': instance.userId,
    };
