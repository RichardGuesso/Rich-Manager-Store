import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gerenciamento_loja/app_theme.dart';
import 'package:gerenciamento_loja/controllers/store_controller.dart';
import 'package:gerenciamento_loja/controllers/theme_controller.dart';
import 'package:gerenciamento_loja/widgets/main_card_widget.dart';
import 'package:gerenciamento_loja/widgets/side_drawer.dart';
import 'package:get/get.dart';

class HomePage extends GetView<StoreController> {
  HomePage({Key? key}) : super(key: key);

  // final themeController = Get.find<ThemeController>();
  // @override
  // StoreController get controller => Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Store'),
        actions: [
          GetBuilder<ThemeController>(
            builder: (themeController) => IconButton(
              onPressed: () async {
                if (Get.isDarkMode) {
                  themeController.changeThemeMode(ThemeMode.light);
                  await themeController.saveTheme(false);
                } else {
                  themeController.changeThemeMode(ThemeMode.dark);
                  await themeController.saveTheme(true);
                }
              },
              icon:
                  Icon(themeController.theme == ThemeMode.dark ? Icons.light_mode_outlined : Icons.dark_mode_outlined),
            ),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainCard(
                title: 'Store Info',
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Store Name:',
                            style: TextStyle(fontSize: 20),
                          ),
                          fit: FlexFit.tight,
                        ),
                        const SizedBox(width: 20),
                        Obx(
                          () => Flexible(
                            child: Text(
                              controller.storeName.value,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Store Followers:',
                            style: TextStyle(fontSize: 20),
                          ),
                          fit: FlexFit.tight,
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            children: [
                              const Text('With Obx'),
                              Obx(
                                () => Text(
                                  controller.followerCount.value.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              const Text('With GetBuilder'),
                              GetBuilder<StoreController>(
                                builder: (newController) => Text(
                                  newController.storeFollowerCount.toString(),
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
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Status:',
                            style: TextStyle(fontSize: 20),
                          ),
                          fit: FlexFit.tight,
                        ),
                        const SizedBox(width: 20),
                        GetX<StoreController>(
                          builder: (sController) => Flexible(
                            child: Text(
                              sController.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: sController.storeStatus.value ? Colors.green.shade700 : Colors.red,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              MainCard(
                title: 'Followers',
                body: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.followerList.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: const StretchMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () {
                              controller.removeFollower(controller.followerList[index]);
                            },
                          ),
                          children: [
                            SlidableAction(
                              onPressed: (ctx) {},
                              label: 'Delete',
                              icon: Icons.delete,
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFFFE4A49),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            controller.followerList[index].toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              MainCard(
                title: 'Reviews',
                body: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.reviews.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.reviews[index].name),
                        subtitle: Text(controller.reviews[index].review),
                        trailing: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              title: 'Review Remove',
                              middleText: 'Do you really want to delete this review?',
                              confirm: OutlinedButton.icon(
                                onPressed: () {
                                  controller.removeReview(controller.reviews[index]);
                                  Get.back();
                                },
                                icon: const Icon(
                                  Icons.check,
                                  color: Colors.red,
                                ),
                                label: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              cancel: OutlinedButton.icon(
                                onPressed: () => Get.back(),
                                icon: const Icon(Icons.back_hand),
                                label: const Text('No'),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
