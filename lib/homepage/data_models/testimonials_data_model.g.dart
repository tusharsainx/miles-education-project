// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonials_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

METestimonialsDataModel _$METestimonialsDataModelFromJson(
        Map<String, dynamic> json) =>
    METestimonialsDataModel(
      testimonials: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => METestimonialDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$METestimonialsDataModelToJson(
        METestimonialsDataModel instance) =>
    <String, dynamic>{
      'data': instance.testimonials,
    };
