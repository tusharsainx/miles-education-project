import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/helper/assets_helper.dart';
import 'package:miles_ed_project/homepage/view/me_homepage_view.dart';

class MEBottomNavigatorController extends GetxController {
  final selectedIndex = 0.obs;
  final pageController = PageController();
  final List<Widget> pages = [
    const MeHomepageView(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
    const Placeholder()
  ];
  final List<Widget> icons = [
    SvgPicture.asset(
      AssetsHelper.home,
      width: 24,
      height: 24,
    ),
    SvgPicture.asset(
      AssetsHelper.calendar,
      width: 24,
      height: 24,
    ),
    SvgPicture.asset(
      AssetsHelper.flame,
      width: 24,
      height: 24,
    ),
    SvgPicture.asset(
      AssetsHelper.event,
      width: 24,
      height: 24,
    ),
    SvgPicture.asset(
      AssetsHelper.user,
      width: 24,
      height: 24,
    ),
  ];
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
