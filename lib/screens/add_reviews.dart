import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/controllers/store_controller.dart';
import 'package:gerenciamento_loja/models/reviews.dart';
import 'package:gerenciamento_loja/widgets/rounded_input_widget.dart';
import 'package:get/get.dart';

class AddReviews extends StatelessWidget {
  AddReviews({Key? key}) : super(key: key);
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Reviews")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedInput(
              hintText: 'Enter Name',
              controller: storeController.reviewNameController,
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: 'Write Review',
              controller: storeController.reviewController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var review = StoreReviews(
                  name: storeController.reviewNameController.text,
                  review: storeController.reviewController.text,
                );
                storeController.addReview(review);
                Get.snackbar(
                    'Reviewed',
                    'Review Added by:\n'
                        '${storeController.reviewNameController.text}',
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(10));
                storeController.reviewController.clear();
                storeController.reviewNameController.clear();
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
                itemCount: storeController.reviews.length,
                itemBuilder: ((context, index) {
                  List<StoreReviews> storeReviews = storeController.reviews
                      .map((element) => StoreReviews(name: element.name, review: element.review))
                      .toList();
                  return ListTile(
                    title: Text(storeReviews[index].name),
                    subtitle: Text(storeReviews[index].review),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
