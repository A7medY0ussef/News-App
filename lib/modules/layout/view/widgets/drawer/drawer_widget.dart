import 'package:flutter/material.dart';
import 'package:news/core/theme/app_assets.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_styles.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/view/widgets/drawer/config_item.dart';
import 'package:news/modules/layout/view/widgets/drawer/drawer_item.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onTap;
  const DrawerWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Drawer(
      backgroundColor: AppColors.blackColor,
      child: Column(
        spacing: height*0.02,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: height*0.06
            ),
            alignment: Alignment.center,
            color: AppColors.whiteColor,
            child: Text('NewsApp', style: AppStyles.large24),
          ),
          InkWell(
            onTap: onTap,
              child: DrawerItem(icon: AppAssets.homeIcon, text: 'Go To Home')),
          Divider(
            thickness: 2,
            indent: width*0.06,
            endIndent: width*0.06,
          ),
          DrawerItem(icon: AppAssets.themeIcon, text: 'Them'),
          ConfigItem(text: 'Dark', onPressed: () {},),
          Divider(
              thickness: 2,
              indent: width*0.06,
              endIndent: width*0.06
          ),
          DrawerItem(icon: AppAssets.languageIcon, text: 'Language'),
          ConfigItem(text: 'English', onPressed: () {},),
        ],
      ),
    );
  }
}