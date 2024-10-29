// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MEFileModel _$MEFileModelFromJson(Map<String, dynamic> json) => MEFileModel(
      isActive: json['active'] as bool?,
      fileId: json['id'] as String?,
      imagePath: json['image_path'] as String?,
      mediaOrder: json['media_order'] as num?,
      mediaType: $enumDecodeNullable(_$MediaTypeEnumMap, json['media_type']),
      postId: json['post'] as String?,
      ratio: json['ratio'],
      thumbnail: json['thumbnail'] as String?,
      videoUrl: json['video_url'] as String?,
    );

Map<String, dynamic> _$MEFileModelToJson(MEFileModel instance) =>
    <String, dynamic>{
      'id': instance.fileId,
      'media_type': _$MediaTypeEnumMap[instance.mediaType],
      'video_url': instance.videoUrl,
      'thumbnail': instance.thumbnail,
      'image_path': instance.imagePath,
      'media_order': instance.mediaOrder,
      'ratio': instance.ratio,
      'active': instance.isActive,
      'post': instance.postId,
    };

const _$MediaTypeEnumMap = {
  MediaType.video: 'video',
  MediaType.image: 'image',
};
