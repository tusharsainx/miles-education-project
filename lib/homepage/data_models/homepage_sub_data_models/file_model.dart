import 'package:json_annotation/json_annotation.dart';
import 'package:miles_ed_project/homepage/helpers/me_enums_helper.dart';
part 'file_model.g.dart';

@JsonSerializable()
class MEFileModel {
  @JsonKey(name: "id")
  final String? fileId;
  @JsonKey(name: "media_type")
  final MediaType? mediaType;
  @JsonKey(name: "video_url")
  final String? videoUrl;
  final String? thumbnail;
  @JsonKey(name: "image_path")
  final String? imagePath;
  @JsonKey(name: "media_order")
  final num? mediaOrder;
  final Object? ratio;
  @JsonKey(name: "active")
  final bool? isActive;
  @JsonKey(name: "post")
  final String? postId;
  MEFileModel(
      {this.isActive,
      this.fileId,
      this.imagePath,
      this.mediaOrder,
      this.mediaType,
      this.postId,
      this.ratio,
      this.thumbnail,
      this.videoUrl});

  factory MEFileModel.fromJson(Map<String, dynamic> json) =>
      _$MEFileModelFromJson(json);
  Map<String, dynamic> toJson() => _$MEFileModelToJson(this);
}
