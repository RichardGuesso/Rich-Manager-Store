import 'package:flutter/material.dart';
import 'package:gerenciamento_loja/constants/colors.dart';
import 'package:get/get.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'GetX Store',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.change_circle_sharp,
              color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              'Change Store Name',
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/edit_name'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_reaction_sharp,
              color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              'Add Followers',
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/add_followers'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_task_sharp,
              color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              'Increment Followers',
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/edit_follower_count'),
          ),
          ListTile(
            leading: Icon(
              Icons.toggle_on_sharp,
              color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              'Toggle Store Status',
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/toggle_status'),
          ),
          ListTile(
            leading: Icon(
              Icons.add_comment_sharp,
              color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
            ),
            title: Text(
              'Add Reviews',
              style: TextStyle(
                fontSize: 18,
                color: Get.isDarkMode ? AppColors.spaceCadet : AppColors.spaceBlue,
              ),
            ),
            onTap: () => Get.offAndToNamed('/add_reviews'),
          )
        ],
      ),
    );
  }
}
