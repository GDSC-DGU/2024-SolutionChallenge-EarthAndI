import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  late final RxInt _currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      _currentPage.value = _pageController.page!.round();
    });

    _currentPage = 0.obs;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSystem.white,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height * 0.85,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset(
                      'assets/images/on_boarding/${Get.deviceLocale?.languageCode == "ko" ? "ko" : "en"}_1.png'),
                  Image.asset(
                      'assets/images/on_boarding/${Get.deviceLocale?.languageCode == "ko" ? "ko" : "en"}_2.png'),
                  Image.asset(
                      'assets/images/on_boarding/${Get.deviceLocale?.languageCode == "ko" ? "ko" : "en"}_3.png'),
                  Image.asset(
                      'assets/images/on_boarding/${Get.deviceLocale?.languageCode == "ko" ? "ko" : "en"}_4.png'),
                  Image.asset(
                      'assets/images/on_boarding/${Get.deviceLocale?.languageCode == "ko" ? "ko" : "en"}_5.png'),
                  Image.asset(
                      'assets/images/on_boarding/${Get.deviceLocale?.languageCode == "ko" ? "ko" : "en"}_6.png'),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 6,
                    effect: WormEffect(
                      dotColor: ColorSystem.grey,
                      activeDotColor: ColorSystem.green,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: Get.width * 0.8,
                    height: 56,
                    child: TextButton(
                      onPressed: () async {
                        if (_pageController.page == 5) {
                          Get.offAllNamed(Routes.ROOT);
                        } else {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: ColorSystem.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Obx(
                        () => Text(
                          _currentPage.value == 5 ? 'start'.tr : 'next'.tr,
                          style: FontSystem.KR20B.copyWith(
                            color: ColorSystem.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
