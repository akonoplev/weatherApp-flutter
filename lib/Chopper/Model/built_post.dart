//import 'package:built_value/built_value.dart';
//import 'package:built_value/serializer.dart';
//
//part 'built_post.g.dart';
//
//abstract class BuiltPost implements Built<BuiltPost, BuiltPostBuilder> {
//  // IDs are set in the back-end.
//  // In a POST request, BuiltPost's ID will be null.
//  // Only BuiltPosts obtained through a GET request will have an ID.
//  @nullable
//  int get id;
//
//  String get title;
//  String get body;
//
//  BuiltPost._();
//
//  factory BuiltPost([updates(BuiltPostBuilder b)]) = _$BuiltPost;
//
//  static Serializer<BuiltPost> get serializer => _$builtPostSerializer;
//}
//
class PostModel {

  int id;
  String title;
  String body;

  PostModel(this.id, this.title, this.body);

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}