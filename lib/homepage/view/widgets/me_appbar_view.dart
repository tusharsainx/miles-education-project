import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/helper/assets_helper.dart';

class MEAppBarView extends StatelessWidget {
  const MEAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetsHelper.meLgoo,
      width: Get.width,
    );
  }
}
