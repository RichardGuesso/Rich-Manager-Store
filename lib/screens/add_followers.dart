import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/controllers/store_controller.dart';
import 'package:gerenciamento_loja/widgets/rounded_input_widget.dart';
import 'package:get/get.dart';

class AddFollowers extends StatelessWidget {
  AddFollowers({Key? key}) : super(key: key);

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Followers')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedInput(
                hintText: "Follower Name",
                controller: storeController.followerController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  storeController.addNewFollower(storeController.followerController.text);
                  Get.snackbar(
                      'Added',
                      'New Follower Added\n '
                          '${storeController.followerController.text}',
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.all(10));
                  storeController.followerController.clear();
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: storeController.followerList.length,
                  itemBuilder: ((context, index) => ListTile(
                        title: Text(storeController.followerList[index]),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
