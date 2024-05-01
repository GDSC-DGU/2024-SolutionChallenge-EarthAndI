import 'package:earth_and_i/providers/analysis/analysis_provider.dart';
import 'package:earth_and_i/providers/analysis/analysis_provider_impl.dart';
import 'package:earth_and_i/providers/notification/notification_provider.dart';
import 'package:earth_and_i/providers/notification/notification_provider_impl.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/analysis_repository.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/follow_repository.dart';
import 'package:earth_and_i/repositories/friend_repository.dart';
import 'package:earth_and_i/repositories/friend_repository_impl.dart';
import 'package:earth_and_i/repositories/notification_repository.dart';
import 'package:earth_and_i/repositories/notification_repository_impl.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Providers
    Get.putAsync<AnalysisProvider>(
      () async => AnalysisProviderImpl(),
    );
    Get.putAsync<NotificationProvider>(
      () async => NotificationProviderImpl(),
    );

    // Repositories
    Get.putAsync<ActionHistoryRepository>(
      () async => ActionHistoryRepository(),
    );
    Get.putAsync<ChallengeHistoryRepository>(
      () async => ChallengeHistoryRepository(),
    );
    Get.putAsync<UserRepository>(
      () async => UserRepository(),
    );
    Get.putAsync<AnalysisRepository>(
      () async => AnalysisRepository(),
    );
    Get.putAsync<FollowRepository>(
      () async => FollowRepository(),
    );
    Get.putAsync<FriendRepository>(
      () async => FriendRepositoryImpl(),
    );
    Get.putAsync<NotificationRepository>(
      () async => NotificationRepositoryImpl(),
    );
  }
}
