import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/homepage/controller/me_homepage_controller.dart';

class MEGreetingView extends GetView<MEHomepageController> {
  const MEGreetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Good Morning!",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  height: 1.2,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "Tushar",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 14,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => controller.openTalkToUsBottomsheet(),
            child: SizedBox(
              height: 100,
              width: Get.width * 0.4,
              child: CachedNetworkImage(
                alignment: Alignment.centerLeft,
                fit: BoxFit.cover,
                imageUrl:
                    "https://s3-alpha-sig.figma.com/img/7394/49b1/f36eefc7ff7e2619cc6b58ba8a97f8c8?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HTKbOVfIBEb0NfcVSHKn7DmNFIwStp8hs2NbDxvTAeW2RT1mm6g1iIZM6qRHJW-5KbUIxUleZL3WEAJGC58SMSI6sYQ0dhM-hivm7Ms4WC2tQNqbDK4yP7HYdYYgZUBT913Z5mXTGoBFk1fbD9TsYlkQ02h9kkFHhDDIuwdZ-f5qRNL7r9KlZQKsfRZgzXS9uH9bHEL3jzvLoDyeCla5P0WeLrdFuYplNhITG2urlKwQiuoLeaVvdhWo2jZ9LlkBaUNEM9BERk2m95CyhWa~QNwtSwlpqTpRc6Mhj7HfbmvjHcTjlUTSBxGcsX4lHdmNYVuKNkMyLt6uL4HmMqJ7lw__",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
