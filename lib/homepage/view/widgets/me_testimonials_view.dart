import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/helper/api_status_class_helper.dart';
import 'package:miles_ed_project/helper/shimmer_helper.dart';
import 'package:miles_ed_project/helper/something_went_wrong.dart';
import 'package:miles_ed_project/homepage/controller/me_homepage_controller.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_reels_page.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class METestimonialsView extends GetView<MEHomepageController> {
  const METestimonialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        switch (controller.testimonialsData.value.apiStatus) {
          case ApiStatus.loading:
            return const _Loading();
          case ApiStatus.success:
            return (controller.testimonialsData.value.data?.testimonials ?? [])
                    .isEmpty
                ? GenericInfo(
                    text: "Not found enough data to display",
                    height: 60,
                    width: double.infinity,
                    onTap: () {
                      controller.fetchTestimonialsMockData();
                    },
                  )
                : _Loaded();
          case ApiStatus.error:
            return GenericInfo(
              text: "Something went wrong",
              height: 60,
              width: double.infinity,
              onTap: () {
                controller.fetchTestimonialsMockData();
              },
            );
        }
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 60, // Adjust height as needed
      child: HorizontalListViewCircleShimmer(
        height: 60,
        width: 60,
      ),
    );
  }
}

class _Loaded extends GetView<MEHomepageController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
          height: 80, // Adjust height as needed
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount:
                controller.testimonialsData.value.data?.testimonials?.length ??
                    0,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  YoutubePlayerController ycontroller = YoutubePlayerController(
                    initialVideoId: ((controller.testimonialsData.value.data
                                    ?.testimonials?[index].videoUrl ??
                                "")
                            .split('/'))
                        .last,
                  );
                  await Get.to(() => MEReelsPage(
                        ycontroller: ycontroller,
                      ));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        controller.testimonialsData.value.data
                                    ?.testimonials?[index].hasWatched ??
                                false
                            ? Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xff464646),
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                              )
                            : SizedBox(
                                width: 60,
                                height: 60,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "https://s3-alpha-sig.figma.com/img/b2d2/cf49/5469e9556d168630f34cc34a303b305b?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k0tdHrx544dXEXhXI93wlNVMqM7zoxaViPqG2JDESm0RoODtzxEVgXRYepA0sEQKD9xpj0jZiYP3iGdssJ2gXXNSykmkAbNtOOeIsNhmuDr3NvIsEG6vFOqwV9o-bDpTS9ML7GONeUwFQjuLqBvfrdlXqo0Vu2-9~VIiCOwm1eIF2xBS6SCSkqVK5zMvdQalUitN32~r4q-6IO-MbX5wfVNaw8xeBwfh7eASzQeUCSBXkqi7Lkb4SKDiYzaR7ceqwiJQkFZzaejCTDhAccpc4R-ZT8tjax4IqbpEUieoYAdivOFIpLkcxbDG7cl0mgcqJ3V9cuN~yL7dV9c09tkqGA__"),
                              ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: SizedBox(
                            height: 50,
                            child: CachedNetworkImage(
                              errorWidget: (context, url, error) =>
                                  const SizedBox(
                                width: 50,
                                height: 50,
                              ),
                              imageUrl:
                                  "https://storage.googleapis.com/miles-usp-bed/Files/Documents/Screenshot_2024-09-20_at_1.35.23PM.png",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 60,
                      child: Text(
                        "${controller.testimonialsData.value.data?.testimonials?[index].firstName ?? ""} ${controller.testimonialsData.value.data?.testimonials?[index].lastName ?? ""}",
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            height: 1.2,
                            color: Color(0xffffffff)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
          )),
    );
  }
}
