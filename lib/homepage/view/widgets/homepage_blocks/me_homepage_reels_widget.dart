import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miles_ed_project/helper/assets_helper.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_data_model.dart';

class MEHomepageReelsWidget extends StatelessWidget {
  const MEHomepageReelsWidget({
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
        Wrap(
          direction: Axis.horizontal,
          spacing: 14,
          runSpacing: 16,
          children:
              List.generate((homepageBlockModel.count ?? 0).toInt(), (index) {
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
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 250,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
