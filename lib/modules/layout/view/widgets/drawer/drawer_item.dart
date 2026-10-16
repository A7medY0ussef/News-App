import 'package:flutter/material.dart';
import 'package:news/core/theme/app_styles.dart';
import 'package:news/core/utils/size_config.dart';

class DrawerItem extends StatelessWidget {
  final String icon;
  final String text;
  const DrawerItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.04,
      ),
      child: Row(
        spacing: width*0.04,
        children: [
          Image.asset(icon),
          Text(text,
          style: AppStyles.large20,),
        ],
      ),
    );
  }
}
