import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/controllers/store_controller.dart';
import 'package:get/get.dart';

class AddFollowerCountPage extends StatelessWidget {
  AddFollowerCountPage({Key? key}) : super(key: key);

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Follower Count')),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'You have add these many followers to your store',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 40),
              Obx(
                () => Text(
                  'With Obs & Obx: ${storeController.followerCount.value}',
                  style: const TextStyle(fontSize: 28),
                ),
              ),
              const SizedBox(height: 40),
              GetBuilder<StoreController>(
                builder: (newController) => Text(
                  'With GetBuilder: ${newController.storeFollowerCount}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storeController.incrementStoreFollowers();
          storeController.updateFollowerCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
