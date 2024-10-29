import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miles_ed_project/helper/assets_helper.dart';
import 'package:miles_ed_project/homepage/controller/me_homepage_controller.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_data_model.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_reels_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MEHomepageInshortsWidget extends GetView<MEHomepageController> {
  const MEHomepageInshortsWidget({
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
              SvgPicture.asset(
                AssetsHelper.headerLine,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Flexible(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
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
              return GestureDetector(
                onTap: () async {
                  final url = homepageBlockModel.posts![index].fullVideoUrl;
                  if (url == null) return;
                  YoutubePlayerController ycontroller = YoutubePlayerController(
                    initialVideoId: (url).split("=").last,
                  );
                  await Get.to(() => MEReelsPage(
                        showFullPage: false,
                        ycontroller: ycontroller,
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: Get.width,
                          height: 200,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [
                                    Color(0xff2F3942),
                                    Color(0xff000B16)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                              borderRadius: BorderRadius.circular(10)),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              height: 170,
                              width: Get.width - 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imageProvider,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AssetsHelper.milesEdLogo,
                              height: 32,
                              width: 32,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width - 60,
                                  child: Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    homepageBlockModel
                                            .posts![index].postTitle ??
                                        "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      height: 1.2,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${(homepageBlockModel.posts![index].likes ?? 0).toInt()} Likes",
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xff606060),
                                    fontSize: 12,
                                    height: 1.5,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            itemCount: (homepageBlockModel.posts ?? []).length,
          ),
        ),
      ],
    );
  }
}
