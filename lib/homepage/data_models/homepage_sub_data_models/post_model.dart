import 'package:json_annotation/json_annotation.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_sub_data_models/file_model.dart';
import 'package:miles_ed_project/homepage/helpers/me_enums_helper.dart';
part 'post_model.g.dart';

@JsonSerializable()
class MEPostModel {
  @JsonKey(name: "id")
  final String? postId;
  final List<MEFileModel>? files;
  @JsonKey(name: "liked_by_me")
  final bool? likedByMe;
  @JsonKey(name: "title")
  final String? postTitle;
  @JsonKey(name: "post_type")
  final PostType? postType;
  @JsonKey(name: "description")
  final String? postDescription;
  final String? metadata;
  @JsonKey(name: "full_video_url")
  final String? fullVideoUrl;
  @JsonKey(name: "blog_url")
  final String? blogUrl;
  @JsonKey(name: "active")
  final bool? isActive;
  @JsonKey(name: "featured")
  final bool? isFeatured;
  final num? priority;
  final num? likes;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "created_by")
  final String? createdBy;
  final String? layout;
  final Object? persona;
  @JsonKey(name: "modified_by")
  final String? modifiedBy;

  MEPostModel({
    this.blogUrl,
    this.createdAt,
    this.createdBy,
    this.files,
    this.fullVideoUrl,
    this.isActive,
    this.isFeatured,
    this.layout,
    this.likedByMe,
    this.likes,
    this.metadata,
    this.modifiedBy,
    this.persona,
    this.postDescription,
    this.postId,
    this.postTitle,
    this.postType,
    this.priority,
    this.updatedAt,
  });
  factory MEPostModel.fromJson(Map<String, dynamic> json) =>
      _$MEPostModelFromJson(json);
  Map<String, dynamic> toJson() => _$MEPostModelToJson(this);
}
