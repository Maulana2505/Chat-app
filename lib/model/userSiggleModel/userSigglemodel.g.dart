// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userSigglemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

userSigglemodel _$userSigglemodelFromJson(Map<String, dynamic> json) =>
    userSigglemodel(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imgprofile: json['imgprofile'] as String?,
    );

Map<String, dynamic> _$userSigglemodelToJson(userSigglemodel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'imgprofile': instance.imgprofile,
    };
