import 'package:earth_and_i/providers/analysis/analysis_provider.dart';
import 'package:earth_and_i/providers/analysis/analysis_provider_impl.dart';
import 'package:earth_and_i/providers/notification/notification_provider.dart';
import 'package:earth_and_i/providers/notification/notification_provider_impl.dart';
import 'package:earth_and_i/repositories/action_history/action_history_repository.dart';
import 'package:earth_and_i/repositories/action_history/action_history_repository_impl.dart';
import 'package:earth_and_i/repositories/analysis/analysis_repository.dart';
import 'package:earth_and_i/repositories/analysis/analysis_repository_impl.dart';
import 'package:earth_and_i/repositories/challenge_history/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/challenge_history/challenge_history_repository_impl.dart';
import 'package:earth_and_i/repositories/follow/follow_repository.dart';
import 'package:earth_and_i/repositories/follow/follow_repository_impl.dart';
import 'package:earth_and_i/repositories/friend/friend_repository.dart';
import 'package:earth_and_i/repositories/friend/friend_repository_impl.dart';
import 'package:earth_and_i/repositories/notification/notification_repository.dart';
import 'package:earth_and_i/repositories/notification/notification_repository_impl.dart';
import 'package:earth_and_i/repositories/user/user_repository.dart';
import 'package:earth_and_i/repositories/user/user_repository_impl.dart';
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
      () async => ActionHistoryRepositoryImpl(),
    );
    Get.putAsync<ChallengeHistoryRepository>(
      () async => ChallengeHistoryRepositoryImpl(),
    );
    Get.putAsync<UserRepository>(
      () async => UserRepositoryImpl(),
    );
    Get.putAsync<AnalysisRepository>(
      () async => AnalysisRepositoryImpl(),
    );
    Get.putAsync<FollowRepository>(
      () async => FollowRepositoryImpl(),
    );
    Get.putAsync<FriendRepository>(
      () async => FriendRepositoryImpl(),
    );
    Get.putAsync<NotificationRepository>(
      () async => NotificationRepositoryImpl(),
    );
  }
}
