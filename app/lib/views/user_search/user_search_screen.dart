import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/user_search/user_search_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/follow/widgets/follow_item.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:earth_and_i/widgets/button/rounded_rectangle_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserSearchScreen extends BaseScreen<UserSearchViewModel> {
  const UserSearchScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "user_search".tr,
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  SizedBox(
                    width: Get.width - 124,
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
                        hintText: "search_hint".tr,
                        onChanged: (value) {
                          viewModel.changeWord(value);
                        },
                        onSubmitted: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                          viewModel.onPressSearch();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(
                    () => viewModel.searchWord.isNotEmpty
                        ? RoundedRectangleTextButton(
                            text: 'search_btn'.tr,
                            textStyle: FontSystem.KR14B
                                .copyWith(color: ColorSystem.white),
                            width: 84,
                            height: 50,
                            backgroundColor: ColorSystem.green,
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              viewModel.onPressSearch();
                            },
                          )
                        : RoundedRectangleTextButton(
                            text: 'search'.tr,
                            textStyle: FontSystem.KR14B.copyWith(
                              color: ColorSystem.grey[300],
                            ),
                            width: 84,
                            height: 50,
                            backgroundColor: ColorSystem.grey[100],
                          ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: viewModel.searchStates.length,
                itemBuilder: (context, index) {
                  return FollowItem(
                    state: viewModel.searchStates[index],
                    onPressed: () {
                      viewModel.onPressedFollowButton(index: index);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
