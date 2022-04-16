import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/controllers/store_controller.dart';
import 'package:get/get.dart';

class StoreStatusPage extends StatelessWidget {
  StoreStatusPage({Key? key}) : super(key: key);

  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Status Toggle")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Is the Store open?',
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Switch(
                  value: storeController.storeStatus.value,
                  activeColor: Colors.green,
                  onChanged: storeController.storeStatus,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
