// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MEPostModel _$MEPostModelFromJson(Map<String, dynamic> json) => MEPostModel(
      blogUrl: json['blog_url'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'] as String?,
      files: (json['files'] as List<dynamic>?)
          ?.map((e) => MEFileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      fullVideoUrl: json['full_video_url'] as String?,
      isActive: json['active'] as bool?,
      isFeatured: json['featured'] as bool?,
      layout: json['layout'] as String?,
      likedByMe: json['liked_by_me'] as bool?,
      likes: json['likes'] as num?,
      metadata: json['metadata'] as String?,
      modifiedBy: json['modified_by'] as String?,
      persona: json['persona'],
      postDescription: json['description'] as String?,
      postId: json['id'] as String?,
      postTitle: json['title'] as String?,
      postType: $enumDecodeNullable(_$PostTypeEnumMap, json['post_type']),
      priority: json['priority'] as num?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MEPostModelToJson(MEPostModel instance) =>
    <String, dynamic>{
      'id': instance.postId,
      'files': instance.files,
      'liked_by_me': instance.likedByMe,
      'title': instance.postTitle,
      'post_type': _$PostTypeEnumMap[instance.postType],
      'description': instance.postDescription,
      'metadata': instance.metadata,
      'full_video_url': instance.fullVideoUrl,
      'blog_url': instance.blogUrl,
      'active': instance.isActive,
      'featured': instance.isFeatured,
      'priority': instance.priority,
      'likes': instance.likes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'layout': instance.layout,
      'persona': instance.persona,
      'modified_by': instance.modifiedBy,
    };

const _$PostTypeEnumMap = {
  PostType.banners: 'banners',
  PostType.reels: 'reels',
  PostType.cta: 'cta',
  PostType.events: 'events',
  PostType.inshorts: 'inshorts',
  PostType.masterclass: 'masterclass',
};
