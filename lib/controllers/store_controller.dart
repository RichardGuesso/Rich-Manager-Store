import 'package:flutter/cupertino.dart';
import 'package:gerenciamento_loja/data/repository.dart';
import 'package:gerenciamento_loja/models/reviews.dart';
import 'package:get/get.dart';

class StoreController extends GetxController {
  ReviewRepository repository;
  StoreController({required this.repository});

  final storeName = 'Thick Shake'.obs;
  final followerCount = 0.obs;
  int storeFollowerCount = 0;
  final storeStatus = true.obs;
  final followerList = [].obs;
  final reviews = <StoreReviews>[].obs;

  final storeNameController = TextEditingController();
  final reviewController = TextEditingController();
  final reviewNameController = TextEditingController();
  final followerController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    reviews.assignAll(repository.readReviews());
    followerList.assignAll(repository.readFollowers());

    ever(reviews, (_) => repository.writeReviews(reviews));
    ever(followerList, (_) => repository.writeFollowers(followerList));
  }

  updateStoreName(String name) {
    storeName(name);
  }

  updateFollowerCount() {
    followerCount.value += 1;
  }

  void incrementStoreFollowers() {
    storeFollowerCount++;

    //update function needs to be called
    update();
  }

  void storeStatusOpen(bool isOpen) {
    storeStatus(isOpen);
  }

  updateFollowerList(List<String> list) {
    followerList.assignAll(list);
  }

  addNewFollower(String name) {
    followerList.add(name);
  }

  void addReview(StoreReviews storeReviews) {
    reviews.add(storeReviews);
  }

  void removeReview(StoreReviews storeReviews) {
    reviews.remove(storeReviews);
  }

  void removeFollower(dynamic item) {
    // List<dynamic> list = [];
    // followerList.forEach((element) {
    //   if (element != item) list.add(element);
    // });
    // print(list);
    // followerList.assignAll(list);
    followerList.remove(item);
  }

  @override
  void dispose() {
    storeNameController.dispose();
    followerController.dispose();
    reviewController.dispose();
    reviewNameController.dispose();
    super.dispose();
  }
}
