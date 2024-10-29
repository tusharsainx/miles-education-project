import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/helper/assets_helper.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_data_model.dart';

class MEHomepageEventsWidget extends StatelessWidget {
  const MEHomepageEventsWidget({
    super.key,
    required this.homepageBlockModel,
  });
  final MEHomepageBlockDataModel homepageBlockModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 30),
          child: Row(
            children: [
              Text(
                homepageBlockModel.blockHeading ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color(0xffffffff),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                AssetsHelper.headerLine,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final thumbnail =
                  homepageBlockModel.posts![index].files!.first.thumbnail;
              final imagePath =
                  homepageBlockModel.posts![index].files!.first.imagePath;
              String? imageUrl;
              if (thumbnail == null && imagePath == null) {
                return const SizedBox();
              } else if (thumbnail == null && imagePath != null) {
                imageUrl = imagePath.split("?").first;
              } else {
                imageUrl = thumbnail!.split("?").first;
              }
              return Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: Get.width-40,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 1,
              );
            },
            itemCount: (homepageBlockModel.posts ?? []).length,
          ),
        ),
      ],
    );
  }
}
