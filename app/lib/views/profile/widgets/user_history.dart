import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/profile/widgets/custom_carbon_bar_chart.dart';
import 'package:earth_and_i/views/profile/widgets/history_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserHistory extends BaseWidget<ProfileViewModel> {
  const UserHistory({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorSystem.grey[200],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: Get.width - 32,
              height: 168,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ColorSystem.white,
                border: Border.all(
                  color: ColorSystem.grey[200]!,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("탄소량 총합", style: FontSystem.KR16SB),
                    const SizedBox(height: 4),
                    Text(
                      viewModel.dailyCarbonState.totalDeltaCO2 > 0
                          ? "↑ ${NumberFormat('#,###,###.####').format(viewModel.dailyCarbonState.totalDeltaCO2.abs())} kg"
                          : "↓ ${NumberFormat('#,###,###.####').format(viewModel.dailyCarbonState.totalDeltaCO2.abs())} kg",
                      style: FontSystem.KR24B.copyWith(
                          color: viewModel.dailyCarbonState.totalDeltaCO2 > 0
                              ? ColorSystem.pink
                              : ColorSystem.green[500]),
                    ),
                    const SizedBox(height: 10),
                    const Expanded(child: CustomCarbonBarChart())
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 걸음 수와 데이터 사용량 관련 정보
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width / 2 - 20,
                  height: 136,
                  decoration: BoxDecoration(
                    color: ColorSystem.white,
                    border: Border.all(
                      color: ColorSystem.grey[200]!,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("걸음으로 지구 지키기", style: FontSystem.KR16SB),
                        const SizedBox(height: 4),
                        const Text("건강에도 좋은 걷기", style: FontSystem.KR12M),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Image.asset(
                                    "assets/images/thumbnail/walking_thumbnail.png",
                                    width: 52,
                                    height: 52,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("${viewModel.dailySteps.toString()}보",
                                        style: FontSystem.KR12M),
                                    Text(
                                        "↓${NumberFormat('#,###,###.####').format(viewModel.dailyStepsCarbonAmount).toString()}kg",
                                        style: FontSystem.KR14SB.copyWith(
                                            color: ColorSystem.green[500])),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width / 2 - 20,
                  height: 136,
                  decoration: BoxDecoration(
                    color: ColorSystem.white,
                    border: Border.all(
                      color: ColorSystem.grey[200]!,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("데이터 사용량 줄이기", style: FontSystem.KR16SB),
                        const SizedBox(height: 4),
                        const Text("도파민 중독에서 벗어나요", style: FontSystem.KR12M),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Image.asset(
                                    "assets/images/thumbnail/data_usage_thumbnail.png",
                                    width: 52,
                                    height: 52),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text("65보", style: FontSystem.KR12M),
                                  Text("↑0.2234kg",
                                      style: FontSystem.KR14SB
                                          .copyWith(color: ColorSystem.pink)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Action History에 대한 List view
            Obx(
              () => ListView.builder(
                itemCount: viewModel.dailyHistory.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, int index) {
                  return HistoryItem(
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
