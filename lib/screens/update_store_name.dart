import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/controllers/store_controller.dart';
import 'package:gerenciamento_loja/widgets/rounded_input_widget.dart';
import 'package:get/get.dart';

class UpdateStoreName extends StatelessWidget {
  UpdateStoreName({Key? key}) : super(key: key);

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Store Name')),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter Store Name',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "Store Name",
              controller: storeController.storeNameController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                storeController.updateStoreName(storeController.storeNameController.text);
                Get.snackbar(
                    'Updated',
                    'Store name has been updated ton '
                        '${storeController.storeNameController.text}',
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.all(10));
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
