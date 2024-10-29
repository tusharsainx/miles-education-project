import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_data_model.dart';

class MeHomepageBannerWidget extends StatelessWidget {
  const MeHomepageBannerWidget({
    super.key,
    required this.homepageBlockModel,
  });
  final MEHomepageBlockDataModel homepageBlockModel;
  @override
  Widget build(BuildContext context) {
    final thumbnail = homepageBlockModel.posts![0].files!.first.thumbnail;
    final imagePath = homepageBlockModel.posts![0].files!.first.imagePath;
    String? imageUrl;
    if (thumbnail == null && imagePath == null) {
      return const SizedBox();
    } else if (thumbnail == null && imagePath != null) {
      imageUrl = imagePath.split("?").first;
    } else {
      imageUrl = thumbnail!.split("?").first;
    }
    return SizedBox(
      height: 285,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: SizedBox(
          width: Get.width,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
