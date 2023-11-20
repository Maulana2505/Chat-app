import 'package:json_annotation/json_annotation.dart';
part 'Post.g.dart';

@JsonSerializable()
class Post {
  late String id;
  late String imgpost;
  late String description;
  late String userId;
  Post({
    required this.id,
    required this.imgpost,
    required this.description,
    required this.userId,
  });
  factory Post.fromJson(Map<String, dynamic> data) =>
      _$PostFromJson(data);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
