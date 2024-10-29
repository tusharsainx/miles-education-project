import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/bottom_navigator/me_bottom_navigator_controller.dart';

class MeBottomNavigator extends GetView<MEBottomNavigatorController> {
  const MeBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          controller.selectedIndex.value;
          return CurvedNavigationBar(
            backgroundColor: Colors.black,
            color: Colors.white,
            items: controller.icons,
            buttonBackgroundColor: const Color(0xff3399FF),
            onTap: (index) {
              controller.selectedIndex.value = index;
            },
          );
        },
      ),
    );
  }
}
