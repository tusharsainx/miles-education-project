import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/homepage/controller/me_homepage_controller.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_appbar_view.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_greetings_view.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_homepage_blocks_view.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_homepage_footer_view.dart';
import 'package:miles_ed_project/homepage/view/widgets/me_testimonials_view.dart';

class MeHomepageView extends GetView {
  const MeHomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    final MEHomepageController controller = Get.find<MEHomepageController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff333333),
        appBar: AppBar(
          backgroundColor: const Color(0xff333333),
          flexibleSpace: const MEAppBarView(),
        ),
        body: RefreshIndicator(
          color: const Color(0xff87CEEB),
          onRefresh: () async {
            controller.init();
          },
          child: CustomScrollView(
            controller: controller.scrollController,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const MEGreetingView(),
                    const METestimonialsView(),
                    const SizedBox(
                      height: 30,
                    ),
                    const MEHomepageBlocksView(),
                    const SizedBox(height: 60),
                    const MEHomepageFooterView(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
