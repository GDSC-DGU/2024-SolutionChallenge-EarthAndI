import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChallengeDialog extends BaseWidget<LoadMapViewModel> {
  final bool isCompleted;
  const ChallengeDialog({super.key, required this.isCompleted});

  @override
  Widget buildView(BuildContext context) {
    return AlertDialog(
      title: DialogTitle(isCompleted: isCompleted),
      content: SizedBox(
        width: Get.width * 0.8,
        height: Get.height * 0.4,
        child: const DialogContent(),
      ),
      insetPadding: const EdgeInsets.all(28),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        SizedBox(
          width: Get.width * 0.8,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              isCompleted
                  ? Get.back()
                  : Get.toNamed("/challenge_authentication");
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color(0xFF90CDBE),
              textStyle: FontSystem.KR20M,
              foregroundColor: Colors.white,
              side: const BorderSide(
                color: Color(0xFF90CDBE),
                width: 1,
              ),
            ),
            child: isCompleted ? const Text("확인") : const Text("챌린지 인증하기"),
          ),
        ),
      ],
    );
  }
}

class DialogTitle extends BaseWidget<LoadMapViewModel> {
  final bool isCompleted;
  const DialogTitle({super.key, required this.isCompleted});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "친환경 제품 사용하기",
                style: FontSystem.KR20B,
              ),
              SizedBox(height: 8),
              Text(
                "친환경 제품 마크가 부착된 상품을 구매해요!",
                style: FontSystem.KR12M,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          if (isCompleted)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/icons/check_small.svg"),
                const Text(
                  "24/02/11",
                  style: FontSystem.KR12M,
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// Dialog content Widget
class DialogContent extends BaseWidget<LoadMapViewModel> {
  const DialogContent({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      height: Get.height * 0.4,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage("assets/icons/thumbnail.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
          ),
          const SizedBox(height: 12),
          const SizedBox(
            height: 96,
            child: Text(
                "챌린지에 대한 상세한 설명... 뒤에는 그냥 아무말입니다. 확실히 하드웨어(아두이노라 하더라도)가 포함된 프로젝트가 상 더라도)가 포함된 프로젝트가 상 ",
                style: FontSystem.KR16M),
          )
        ],
      ),
    );
  }
}
