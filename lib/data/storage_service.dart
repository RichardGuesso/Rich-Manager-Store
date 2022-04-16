import 'package:gerenciamento_loja/constants/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(reviewsKey, []);
    await _box.writeIfNull(followersKey, []);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
