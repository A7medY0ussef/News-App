import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_styles.dart';

import '../../../../../core/utils/size_config.dart';

class ConfigItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ConfigItem({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      padding: EdgeInsets.only(left: width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        border: Border.all(color: AppColors.whiteColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppStyles.medium20White),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.arrow_drop_down_outlined,
              size: 25,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
