import 'dart:io';

import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChallengeAuthenticationScreen
    extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ChallengeAuthenticationScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "챌린지 인증하기",
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("쌓아둔 이메일 삭제하기", style: FontSystem.KR20SB120),
          const SizedBox(height: 8),
          const Text("친환경 제품 마크가 부착된 상품을 구매해요!", style: FontSystem.KR16M),
          const SizedBox(height: 20),
          Obx(
            () => viewModel.image == null
                ? Expanded(
                    child: Center(
                      child: Container(
                        color: const Color(0xFFF8F9FC),
                      ),
                    ),
                  )
                : Expanded(
                    child: Center(
                      child: Image.file(
                        File(viewModel.image!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: Get.width * 0.92,
              height: 56,
              child: OutlinedButton(
                onPressed: () => viewModel.getImage(),
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
                child: const Text("사진 선택하기"),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: SizedBox(
                width: Get.width * 0.92,
                height: 56,
                child: Obx(
                  () => viewModel.image == null
                      ? OutlinedButton(
                          onPressed: () {
                            Get.snackbar("사진이 없어요 :(", "사진을 선택해주세요!");
                          },
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: const Color(0xFFF8F9FC),
                            textStyle: FontSystem.KR20M,
                            foregroundColor: const Color(0xFFACADB2),
                            side: const BorderSide(
                              color: Color(0xFFF8F9FC),
                              width: 1,
                            ),
                          ),
                          child: const Text("인증하기"),
                        )
                      : OutlinedButton(
                          onPressed: () {
                            DevOnLog.i("사진 인증하기");
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
                          child: const Text("인증하기"),
                        ),
                )),
          )
        ],
      ),
    );
  }
}
