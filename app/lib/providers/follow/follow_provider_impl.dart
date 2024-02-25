import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_and_i/providers/follow/follow_provider.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FollowProviderImpl implements FollowProvider {
  const FollowProviderImpl({
    required FirebaseFirestore storage,
  }) : _storage = storage;

  final FirebaseFirestore _storage;

  @override
  Future<void> postFollowing(String id) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await _storage.collection('follows').doc(uid).update({
      'followings': FieldValue.arrayUnion([id])
    });
  }

  @override
  Future<void> deleteFollowing(String id) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    await _storage.collection('follows').doc(uid).update({
      'followings': FieldValue.arrayRemove([id])
    });
  }

  @override
  Future<List<dynamic>> getFollowings() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    List<dynamic> followings =
        (await _storage.collection('follows').doc(uid).get())
            .data()!['followings'];

    if (followings.isEmpty) {
      return [];
    }

    // Map<String, dynamic>으로 바꾸고 isFollowing 추가
    List<dynamic> users = (await _storage
            .collection("users")
            .where("id", whereIn: followings)
            .get())
        .docs
        .map((e) => e.data())
        .toList();

    return users.map((user) {
      user['is_following'] = true;
      return user;
    }).toList();
  }

  @override
  Future<List<dynamic>> getFollowers() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    List<dynamic> followers =
        (await _storage.collection('follows').doc(uid).get())
            .data()!['followers'];

    if (followers.isEmpty) {
      return [];
    }

    List<bool> isFollowings = List.filled(followers.length, false);

    List<dynamic> followings =
        (await _storage.collection('follows').doc(uid).get())
            .data()!['followings'];

    for (int i = 0; i < followers.length; i++) {
      if (followings.contains(followers[i])) {
        isFollowings[i] = true;
      }
    }

    List<dynamic> users = (await _storage
            .collection("users")
            .where("id", whereIn: followers)
            .get())
        .docs
        .map((e) => e.data())
        .toList();

    return users.asMap().entries.map((e) {
      e.value['is_following'] = isFollowings[e.key];
      return e.value;
    }).toList();
  }
}
