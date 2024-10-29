import 'package:json_annotation/json_annotation.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_sub_data_models/post_model.dart';
import 'package:miles_ed_project/homepage/helpers/me_enums_helper.dart';
part 'homepage_data_model.g.dart';

@JsonSerializable()
class MEHomepageDataModel {
  @JsonKey(name: "data")
  final List<MEHomepageBlockDataModel>? homepageData;
  MEHomepageDataModel({this.homepageData});
  factory MEHomepageDataModel.fromJson(Map<String, dynamic> json) =>
      _$MEHomepageDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MEHomepageDataModelToJson(this);
}

///Homepage is divided into multiple blocks. Each block's data can be accumulated in [MEHomepageBlockDataModel]
@JsonSerializable()
class MEHomepageBlockDataModel {
  @JsonKey(name: 'id')
  final String? blockId;
  @JsonKey(name: 'block_type')
  final BlockType? blockType;
  @JsonKey(name: 'name')
  final String? blockName;
  @JsonKey(name: 'heading')
  final String? blockHeading;
  final num? position;
  final num? count;
  @JsonKey(name: 'active')
  final bool? isActive;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final String? vertical;
  @JsonKey(name: 'created_by')
  final Object? createdBy;
  @JsonKey(name: 'modified_by')
  final Object? modifiedBy;
  final List<MEPostModel>? posts;

  MEHomepageBlockDataModel(
      {this.blockHeading,
      this.blockId,
      this.blockName,
      this.blockType,
      this.count,
      this.createdAt,
      this.createdBy,
      this.isActive,
      this.modifiedBy,
      this.position,
      this.posts,
      this.updatedAt,
      this.vertical});
  factory MEHomepageBlockDataModel.fromJson(Map<String, dynamic> json) =>
      _$MEHomepageBlockDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MEHomepageBlockDataModelToJson(this);
}
