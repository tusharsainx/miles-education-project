import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/helper/api_status_class_helper.dart';
import 'package:miles_ed_project/helper/shimmer_helper.dart';
import 'package:miles_ed_project/helper/something_went_wrong.dart';
import 'package:miles_ed_project/homepage/controller/me_homepage_controller.dart';
import 'package:miles_ed_project/homepage/helpers/me_enums_helper.dart';
import 'package:miles_ed_project/homepage/view/widgets/homepage_blocks/me_homepage_banner_widget.dart';
import 'package:miles_ed_project/homepage/view/widgets/homepage_blocks/me_homepage_events_widget.dart';
import 'package:miles_ed_project/homepage/view/widgets/homepage_blocks/me_homepage_inshorts_widget.dart';
import 'package:miles_ed_project/homepage/view/widgets/homepage_blocks/me_homepage_masterclass_widget.dart';
import 'package:miles_ed_project/homepage/view/widgets/homepage_blocks/me_homepage_reels_widget.dart';
import 'package:miles_ed_project/homepage/view/widgets/homepage_blocks/me_homepage_cta_widget.dart';

class MEHomepageBlocksView extends GetView<MEHomepageController> {
  const MEHomepageBlocksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (controller.homepageData.value.apiStatus) {
          case ApiStatus.loading:
            return _Loading();
          case ApiStatus.success:
            return (controller.homepageData.value.data?.homepageData ?? [])
                    .isEmpty
                ? GenericInfo(
                    text: "Not found enough data to display",
                    height: 60,
                    width: double.infinity,
                    onTap: () {
                      controller.fetchHomepageMockData();
                    },
                  )
                : _Loaded();
          case ApiStatus.error:
            return GenericInfo(
              text: "Something went wrong",
              height: 60,
              width: double.infinity,
              onTap: () {
                controller.fetchHomepageMockData();
              },
            );
        }
      },
    );
  }
}

class _Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBoxShimmer(
            width: Get.width,
            height: 300,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBoxShimmer(width: Get.width * 0.5 - 20, height: 250),
            ),
            SizedBoxShimmer(width: Get.width * 0.5, height: 250),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: SizedBoxShimmer(
                width: Get.width * 0.5 - 20,
                height: 250,
              ),
            ),
            SizedBoxShimmer(
              width: Get.width * 0.5,
              height: 250,
            ),
          ],
        ),
      ],
    );
  }
}

class _Loaded extends GetView<MEHomepageController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          (controller.homepageData.value.data?.homepageData ?? []).length,
          (index) {
            final blockModel =
                controller.homepageData.value.data?.homepageData?[index];
            if (blockModel == null) return const SizedBox.shrink();

            switch (blockModel.blockType) {
              case BlockType.banners:
                return MeHomepageBannerWidget(homepageBlockModel: blockModel);
              case BlockType.cta:
                return MEHomepageCTAWidget(homepageBlockModel: blockModel);
              case BlockType.events:
                return MEHomepageEventsWidget(homepageBlockModel: blockModel);
              case BlockType.inshorts:
                return MEHomepageInshortsWidget(homepageBlockModel: blockModel);
              case BlockType.reels:
                return MEHomepageReelsWidget(homepageBlockModel: blockModel);
              case BlockType.masterclass:
                return MEHomepageMasterclassWidget(
                    homepageBlockModel: blockModel);
              default:
                return const SizedBox.shrink();
            }
          },
        ).toList(),
      ),
    );
  }
}
