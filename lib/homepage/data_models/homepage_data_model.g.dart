// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MEHomepageDataModel _$MEHomepageDataModelFromJson(Map<String, dynamic> json) =>
    MEHomepageDataModel(
      homepageData: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              MEHomepageBlockDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MEHomepageDataModelToJson(
        MEHomepageDataModel instance) =>
    <String, dynamic>{
      'data': instance.homepageData,
    };

MEHomepageBlockDataModel _$MEHomepageBlockDataModelFromJson(
        Map<String, dynamic> json) =>
    MEHomepageBlockDataModel(
      blockHeading: json['heading'] as String?,
      blockId: json['id'] as String?,
      blockName: json['name'] as String?,
      blockType: $enumDecodeNullable(_$BlockTypeEnumMap, json['block_type']),
      count: json['count'] as num?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdBy: json['created_by'],
      isActive: json['active'] as bool?,
      modifiedBy: json['modified_by'],
      position: json['position'] as num?,
      posts: (json['posts'] as List<dynamic>?)
          ?.map((e) => MEPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      vertical: json['vertical'] as String?,
    );

Map<String, dynamic> _$MEHomepageBlockDataModelToJson(
        MEHomepageBlockDataModel instance) =>
    <String, dynamic>{
      'id': instance.blockId,
      'block_type': _$BlockTypeEnumMap[instance.blockType],
      'name': instance.blockName,
      'heading': instance.blockHeading,
      'position': instance.position,
      'count': instance.count,
      'active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'vertical': instance.vertical,
      'created_by': instance.createdBy,
      'modified_by': instance.modifiedBy,
      'posts': instance.posts,
    };

const _$BlockTypeEnumMap = {
  BlockType.banners: 'banners',
  BlockType.reels: 'reels',
  BlockType.cta: 'cta',
  BlockType.events: 'events',
  BlockType.inshorts: 'inshorts',
  BlockType.masterclass: 'masterclass',
};
