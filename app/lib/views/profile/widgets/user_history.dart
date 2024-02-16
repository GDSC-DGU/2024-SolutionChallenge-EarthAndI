import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/weekly_calendar_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/profile/widgets/custom_carbon_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserHistory extends BaseWidget<WeeklyCalendarViewModel> {
  const UserHistory({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF0F1F5),
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
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("탄소량 총합", style: FontSystem.KR16SB),
                  const SizedBox(height: 4),
                  Text("↓ 3.2453 kg",
                      style: FontSystem.KR24B
                          .copyWith(color: const Color(0xFF90CDBE))),
                  const SizedBox(height: 10),
                  const Expanded(child: CustomCarbonBarChart())
                ],
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
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset("assets/images/character.svg",
                                  width: 52, height: 52),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("12000보", style: FontSystem.KR12M),
                                  Text("0.1234kg", style: FontSystem.KR14SB),
                                ],
                              )
                            ],
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
                    color: Colors.white,
                    border: Border.all(
                      color: const Color(0xFFE5E5E5),
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
                              SvgPicture.asset("assets/images/character.svg",
                                  width: 52, height: 52),
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("12000보", style: FontSystem.KR12M),
                                  Text("0.1234kg", style: FontSystem.KR14SB),
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
            ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/images/character.svg",
                              width: 72, height: 72),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("행위", style: FontSystem.KR16SB),
                                    Text("기록한 날짜", style: FontSystem.KR12R),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Q: 질문", style: FontSystem.KR12R),
                                        Text("A: 그에 따른 답변",
                                            style: FontSystem.KR12R)
                                      ],
                                    ),
                                    Text(
                                      "! 0.1234kg",
                                      style: FontSystem.KR16SB,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
