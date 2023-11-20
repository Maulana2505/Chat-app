// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      dataSearch: Data.fromJson(json['dataSearch'] as Map<String, dynamic>),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'dataSearch': instance.dataSearch.toJson(),
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      imgprofile: json['imgprofile'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'imgprofile': instance.imgprofile,
    };
