import 'package:json_annotation/json_annotation.dart';
import 'package:miles_ed_project/homepage/data_models/testimonials_sub_data_models/testimonial_data_model.dart';
part 'testimonials_data_model.g.dart';

@JsonSerializable()
class METestimonialsDataModel {
  @JsonKey(name: "data")
  final List<METestimonialDataModel>? testimonials;
  METestimonialsDataModel({this.testimonials});
  factory METestimonialsDataModel.fromJson(Map<String, dynamic> json) =>
      _$METestimonialsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$METestimonialsDataModelToJson(this);
}
