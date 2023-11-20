import 'package:json_annotation/json_annotation.dart';

import 'package:chat_app/model/following/following_model.dart';
import 'package:chat_app/model/postmodel/Post.dart';


part 'usermodel.g.dart';

@JsonSerializable(explicitToJson: true)
class usermodel {
  late String id;
  late String email;
  late String username;
  late String password;
  String? imgprofile;
  List<Post> post;
  List<Following> following;
  usermodel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.imgprofile,
    required this.post,
    required this.following
  });
  factory usermodel.fromJson(Map<String, dynamic> data) =>
      _$usermodelFromJson(data);
  Map<String, dynamic> toJson() => _$usermodelToJson(this);
}
