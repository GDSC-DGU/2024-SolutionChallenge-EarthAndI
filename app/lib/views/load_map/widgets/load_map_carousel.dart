import 'package:carousel_slider/carousel_slider.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadMapCarousel extends BaseWidget<LoadMapViewModel> {
  const LoadMapCarousel({super.key});

  @override
  Widget buildView(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 32.0,
        autoPlay: true,
        viewportFraction: 1.2,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1500),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        Container(
          width: Get.width - 32,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: const Center(
            child: Text(
              "찬물 세탁도 지구를 지킬 수 있답니다!",
              style: FontSystem.KR12B,
            ),
          ),
        ),
        Container(
          width: Get.width - 32,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: const Center(
            child: Text(
              "불필요한 이메일을 지우면 지구를 지킬 수 있어요!",
              style: FontSystem.KR12B,
            ),
          ),
        ),
        Container(
          width: Get.width - 32,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: const Center(
            child: Text(
              "종이컵 대신 개인용 텀블러를 사용해보세요!",
              style: FontSystem.KR12B,
            ),
          ),
        ),
      ],
    );
  }
}
