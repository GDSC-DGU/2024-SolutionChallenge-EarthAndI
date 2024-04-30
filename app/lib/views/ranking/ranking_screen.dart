import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/ranking/ranking_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/ranking/widget/ranking_item.dart';
import 'package:earth_and_i/views/ranking/widget/top_ranking_item.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:earth_and_i/widgets/dialog/message_dialog.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RankingScreen extends BaseScreen<RankingViewModel> {
  const RankingScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.grey[200];

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "ranking".tr,
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        topRankView(),
        rankView(),
      ],
    );
  }

  Widget topRankView() => SliverToBoxAdapter(
        child: Container(
          color: ColorSystem.white,
          child: Column(
            children: [
              InfinityLine(
                height: 1,
                color: ColorSystem.grey[300],
              ),
              const SizedBox(height: 35),
              Text(
                "E&I",
                style: FontSystem.KR16M.copyWith(
                  color: ColorSystem.grey,
                ),
              ),
              Text(
                "Total Rank".tr,
                style: FontSystem.KR32B.copyWith(
                  color: ColorSystem.grey[900],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 172.6,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: viewModel.topRankingStates.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TopRankingItem(
                        index: index,
                        state: viewModel.topRankingStates[index],
                        onTap: () {
                          if (viewModel.topRankingStates[index].id == null) {
                            // Todo: Implement not yet registered Translation
                            Get.snackbar(
                              "error".tr,
                              "not_yet_registered".tr,
                              backgroundColor: ColorSystem.grey[300],
                              colorText: ColorSystem.black,
                              duration: const Duration(seconds: 1),
                            );
                          } else {
                            onTapTopRankItem(index);
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );

  Widget rankView() => Obx(
        () => SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: viewModel.rankingStates.length,
            (BuildContext context, int index) {
              return RankingItem(
                rank: index + 4,
                isLast: index == viewModel.rankingStates.length - 1,
                state: viewModel.rankingStates[index],
                onTap: () {
                  onTapRankItem(index);
                },
              );
            },
          ),
        ),
      );

  void onTapTopRankItem(int index) {
    viewModel.fetchMessageState(true, index);

    Get.dialog(
      MessageDialog(
        state: viewModel.messageState,
        onSend: viewModel.fetchMessageInMessageState,
      ),
    ).then((value) => viewModel.messageState.toString());
  }

  void onTapRankItem(int index) {
    viewModel.fetchMessageState(false, index);

    Get.dialog(
      MessageDialog(
        state: viewModel.messageState,
        onSend: viewModel.fetchMessageInMessageState,
      ),
    ).then((value) => {
          if (viewModel.messageState.message.isNotEmpty)
            {
              viewModel.sendMessage(),
            }
        });
  }
}
