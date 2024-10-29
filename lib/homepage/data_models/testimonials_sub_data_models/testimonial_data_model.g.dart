// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

METestimonialDataModel _$METestimonialDataModelFromJson(
        Map<String, dynamic> json) =>
    METestimonialDataModel(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as String?,
      description: json['description'] as String?,
      firstName: json['first_name'] as String?,
      fullVideoUrl: json['full_video_url'] as String?,
      hasWatched: json['watched'] as bool?,
      imageUrl: json['image_url'] as String?,
      isLikedByMe: json['liked_by_me'] as bool?,
      lastName: json['last_name'] as String?,
      likes: json['likes'] as num?,
      modifiedBy: json['modified_by'] as String?,
      testimonialId: json['id'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      videoUrl: json['video_url'] as String?,
    );

Map<String, dynamic> _$METestimonialDataModelToJson(
        METestimonialDataModel instance) =>
    <String, dynamic>{
      'id': instance.testimonialId,
      'liked_by_me': instance.isLikedByMe,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'video_url': instance.videoUrl,
      'full_video_url': instance.fullVideoUrl,
      'likes': instance.likes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'modified_by': instance.modifiedBy,
      'watched': instance.hasWatched,
    };
