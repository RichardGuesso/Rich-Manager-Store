import 'package:gerenciamento_loja/data/provider.dart';
import 'package:gerenciamento_loja/data/repository.dart';
import 'package:get/get.dart';
import 'controllers/store_controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(
        repository: ReviewRepository(
          storeProvider: StoreProvider(),
        ),
      ),
    );
  }
}
