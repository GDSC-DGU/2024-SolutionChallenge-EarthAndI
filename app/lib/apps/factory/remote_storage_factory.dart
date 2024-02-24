import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_and_i/providers/follow/follow_provider.dart';
import 'package:earth_and_i/providers/follow/follow_provider_impl.dart';
import 'package:earth_and_i/providers/user/user_remote_provider.dart';
import 'package:earth_and_i/providers/user/user_remote_provider_impl.dart';

abstract class RemoteStorageFactory {
  static FirebaseFirestore? _instance;

  static UserRemoteProvider? _userRemoteProvider;
  static FollowProvider? _followProvider;

  static UserRemoteProvider get userRemoteProvider => _userRemoteProvider!;
  static FollowProvider get followProvider => _followProvider!;

  static Future<void> onInit() async {
    _instance = FirebaseFirestore.instance;

    _userRemoteProvider = UserRemoteProviderImpl(storage: _instance!);
    _followProvider = FollowProviderImpl(storage: _instance!);
  }
}
