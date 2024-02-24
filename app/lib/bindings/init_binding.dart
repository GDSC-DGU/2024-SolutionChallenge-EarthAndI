import 'package:earth_and_i/providers/analysis/analysis_provider_impl.dart';
import 'package:earth_and_i/providers/analysis/analysis_provider.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/analysis_repository.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/follow_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Remote Providers
    Get.putAsync<AnalysisProvider>(() async => AnalysisProviderImpl());

    // Local Repositories
    Get.putAsync<ActionHistoryRepository>(
        () async => ActionHistoryRepository());
    Get.putAsync(() async => ChallengeHistoryRepository());
    Get.putAsync(() async => UserRepository());

    // Remote Repositories
    Get.putAsync(() async => AnalysisRepository());
    Get.putAsync(() async => FollowRepository());
  }
}
