import 'dart:convert';

import 'package:gerenciamento_loja/constants/keys.dart';
import 'package:gerenciamento_loja/data/storage_service.dart';
import 'package:gerenciamento_loja/models/reviews.dart';
import 'package:get/get.dart';

class StoreProvider {
  final StorageService _storageService = Get.find<StorageService>();

  // Methods to Reviews
  List<StoreReviews> readReviews() {
    var reviwes = <StoreReviews>[];
    jsonDecode(_storageService.read(reviewsKey).toString()).forEach((e) => reviwes.add(StoreReviews.fromJson(e)));
    return reviwes;
  }

  Future<void> writeReview(List<StoreReviews> reviews) async {
    await _storageService.write(reviewsKey, jsonEncode(reviews));
  }

  // Methods to Followers
  List<dynamic> readFollowers() {
    var followers = <dynamic>[];
    jsonDecode(_storageService.read(followersKey).toString()).forEach((e) => followers.add(e));
    return followers;
  }

  Future<void> writeFollowers(List<dynamic> followers) async {
    await _storageService.write(followersKey, jsonEncode(followers));
  }
}
