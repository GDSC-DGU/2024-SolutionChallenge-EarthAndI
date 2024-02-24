import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/follow/follow_search_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FriendSearchBottomSheet extends BaseWidget<UserSearchViewModel> {
  const FriendSearchBottomSheet({super.key});

  @override
  Widget buildView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: Get.width,
              height: Get.height * 0.15,
              color: Colors.transparent,
            ),
          ),
          Container(
            width: Get.width,
            height: Get.height * 0.85,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  DefaultAppBar(
                    title: "친구 추가",
                    actions: [
                      CustomIconButton(
                          assetPath: "assets/icons/close.svg",
                          onPressed: () {
                            Get.back();
                          })
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Obx(
                      () => SearchBar(
                        controller: viewModel.searchController,
                        leading: SvgPicture.asset("assets/icons/search.svg"),
                        trailing: viewModel.searchWord != ""
                            ? [
                                IconButton(
                                    onPressed: () {
                                      viewModel.onPressReset();
                                      viewModel.searchController.clear();
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/icons/close.svg"))
                              ]
                            : null,
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFF8F9FC),
                        ),
                        surfaceTintColor: MaterialStateProperty.all(
                          const Color(0xFFF8F9FC),
                        ),
                        overlayColor: MaterialStateProperty.all(
                          const Color(0xFFF8F9FC),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        hintStyle: MaterialStateProperty.all(FontSystem.KR16R180
                            .copyWith(color: const Color(0xFFACADB2))),
                        hintText: "검색어를 입력하세요!",
                        onTap: () {
                          viewModel.onTapSetIsKeyboardOpen(true);
                        },
                        onChanged: (value) {
                          viewModel.searchFriend(value);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
