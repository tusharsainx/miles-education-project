import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:miles_ed_project/helper/api_status_class_helper.dart';
import 'package:miles_ed_project/homepage/data_models/homepage_data_model.dart';
import 'package:miles_ed_project/homepage/data_models/testimonials_data_model.dart';
import 'package:miles_ed_project/homepage/repository/me_homepage_repository.dart';

class MEHomepageController extends GetxController {
  final homepageData = Status<MEHomepageDataModel>.loading().obs;
  final testimonialsData = Status<METestimonialsDataModel>.loading().obs;
  final _homepageRepository = MEHomepageRepository();
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 2));
  final scrollController = ScrollController();
  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void init() {
    fetchHomepageMockData();
    fetchTestimonialsMockData();
  }

  void fetchHomepageMockData() async {
    homepageData.value = Status.loading();
    try {
      final response = await _homepageRepository.getHomepageData();
      homepageData.value = response;
    } catch (e) {
      homepageData.value = Status.error();
    }
  }

  void fetchTestimonialsMockData() async {
    testimonialsData.value = Status.loading();
    try {
      final response = await _homepageRepository.getTestimonialsData();
      testimonialsData.value = response;
    } catch (e) {
      testimonialsData.value = Status.error();
    }
  }

  void openTalkToUsBottomsheet() async {
    _confettiController.play(); // Start confetti when the bottom sheet opens
    await showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      showDragHandle: false,
      enableDrag: false,
      builder: (context) {
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.black,
              ),
              height: Get.height * 0.25,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            FontAwesomeIcons.x,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Thank you for showing interest in us!!",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      textAlign: TextAlign.center,
                      "Our SPOC will be connecting with you\nshortly on your provided details.",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: const [
                    Colors.blue,
                    Colors.red,
                    Colors.green,
                    Colors.orange,
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ).whenComplete(
      () {
        _confettiController.stop();
      },
    );
  }
}
