import 'package:home_widget/home_widget.dart';

import 'package:flutter/foundation.dart' as foundation;

abstract class WidgetUtil {
  static const String appGroupIdentifier = 'group.earthAndI.userInfoWidget';
  static const String iOSWidgetName = 'userInfoWidget';
  static const String androidWidgetName = 'UserInfoWidget';

  static Future<void> onInit() async {
    await HomeWidget.setAppGroupId(appGroupIdentifier);
  }

  static void setInformation({
    required double positiveDeltaCO2,
    required double negativeDeltaCO2,
    required bool isHealthCondition,
    required bool isMentalCondition,
    required bool isCashCondition,
  }) {
    // Saving Character Asset
    HomeWidget.saveWidgetData<String>(
      WidgetUtilExtension.characterAsset,
      _toCharacterAssetPath(
        positiveDeltaCO2: positiveDeltaCO2,
        negativeDeltaCO2: negativeDeltaCO2,
        isHealthCondition: isHealthCondition,
        isMentalCondition: isMentalCondition,
        isCashCondition: isCashCondition,
      ),
    );

    // Saving Positive Delta CO2
    // 안드로이드 아이폰 경우의 수 나누기, 안드로이드는 int 값으로, 아이폰은 double 값으로 저장
    if (foundation.defaultTargetPlatform == foundation.TargetPlatform.android) {
      HomeWidget.saveWidgetData<int>(WidgetUtilExtension.positiveDeltaCO2,
          (positiveDeltaCO2.abs() * 10000).round());
    } else {
      HomeWidget.saveWidgetData<double>(
          WidgetUtilExtension.positiveDeltaCO2, positiveDeltaCO2);
    }

    // Saving Negative Delta CO2
    if (foundation.defaultTargetPlatform == foundation.TargetPlatform.android) {
      HomeWidget.saveWidgetData<int>(WidgetUtilExtension.negativeDeltaCO2,
          (negativeDeltaCO2 * 10000).round());
    } else {
      HomeWidget.saveWidgetData<double>(
          WidgetUtilExtension.negativeDeltaCO2, negativeDeltaCO2);
    }

    // Update Widget
    HomeWidget.updateWidget(
      iOSName: iOSWidgetName,
      androidName: androidWidgetName,
    );
  }

  static String _toCharacterAssetPath({
    required double positiveDeltaCO2,
    required double negativeDeltaCO2,
    required bool isHealthCondition,
    required bool isMentalCondition,
    required bool isCashCondition,
  }) {
    String eco = positiveDeltaCO2.abs() >= negativeDeltaCO2 ? '1' : '2';
    String health = isHealthCondition ? '1' : '2';
    String mental = isMentalCondition ? '1' : '2';
    String cash = isCashCondition ? '1' : '2';

    return '${eco}_${health}_${mental}_$cash';
  }
}

extension WidgetUtilExtension on WidgetUtil {
  static const String characterAsset = 'character_asset';
  static const String positiveDeltaCO2 = 'positive_delta_CO2';
  static const String negativeDeltaCO2 = 'negative_delta_CO2';
}
