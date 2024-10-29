import 'package:json_annotation/json_annotation.dart';
part 'testimonial_data_model.g.dart';

@JsonSerializable()
class METestimonialDataModel {
  @JsonKey(name: "id")
  final String? testimonialId;
  @JsonKey(name: "liked_by_me")
  final bool? isLikedByMe;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  final String? description;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "video_url")
  final String? videoUrl;
  @JsonKey(name: "full_video_url")
  final String? fullVideoUrl;
  final num? likes;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @JsonKey(name: "created_by")
  final String? createdBy;
  @JsonKey(name: "modified_by")
  final String? modifiedBy;
  @JsonKey(name: "watched")
  final bool? hasWatched;
  METestimonialDataModel({
    this.createdAt,
    this.createdBy,
    this.description,
    this.firstName,
    this.fullVideoUrl,
    this.hasWatched,
    this.imageUrl,
    this.isLikedByMe,
    this.lastName,
    this.likes,
    this.modifiedBy,
    this.testimonialId,
    this.updatedAt,
    this.videoUrl,
  });
  factory METestimonialDataModel.fromJson(Map<String, dynamic> json) =>
      _$METestimonialDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$METestimonialDataModelToJson(this);
}
