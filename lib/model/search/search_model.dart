
import 'package:json_annotation/json_annotation.dart';

part 'search_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Search {
  Data dataSearch;
  String msg;
  Search({
    required this.dataSearch,
    required this.msg,
  });
  factory Search.fromJson(Map<String, dynamic> data) =>
      _$SearchFromJson(data);
  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

@JsonSerializable()
class Data {
  String id;
  String username;
  String email;
  String password;
  String? imgprofile;
  Data({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.imgprofile,
  });
  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
