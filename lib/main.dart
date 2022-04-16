import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/app_theme.dart';
import 'package:gerenciamento_loja/controllers/theme_controller.dart';
import 'package:gerenciamento_loja/data/storage_service.dart';
import 'package:gerenciamento_loja/screens/add_followers.dart';
import 'package:gerenciamento_loja/screens/add_reviews.dart';
import 'package:gerenciamento_loja/screens/follower_count_page.dart';
import 'package:gerenciamento_loja/screens/home.dart';
import 'package:gerenciamento_loja/screens/update_store_name.dart';
import 'package:gerenciamento_loja/screens/store_status.dart';
import 'package:gerenciamento_loja/store_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Store',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      initialRoute: '/',
      home: HomePage(),
      initialBinding: StoreBinding(),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/edit_name', page: () => UpdateStoreName()),
        GetPage(name: '/add_followers', page: () => AddFollowers()),
        GetPage(name: '/toggle_status', page: () => StoreStatusPage()),
        GetPage(name: '/edit_follower_count', page: () => AddFollowerCountPage()),
        GetPage(name: '/add_reviews', page: () => AddReviews()),
        // GetPage(name: '/update_menu', page: () => const UpdateMenu()),
      ],
    );
  }
}
