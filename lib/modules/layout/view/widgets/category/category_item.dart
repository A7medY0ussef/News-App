import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/modules/layout/data/models/category/category_model.dart';

import '../../../../../core/utils/size_config.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    final theme = Theme.of(context);
    var isEven = (index % 2 == 0);
    return Stack(
      alignment: isEven
          ? AlignmentDirectional.bottomEnd
          : AlignmentDirectional.bottomStart,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(24),
          child: Image.asset(category.image),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(
            start: isEven ? width*0.04 : 0,
            end: !isEven ? width*0.04 : 0,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: width*0.04,
            vertical: height*0.02
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadiusGeometry.circular(35),
            color: AppColors.greyColor,
          ),

          child: Row(
            textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
            spacing: width*0.04,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('View All',
              style: theme.textTheme.headlineMedium,),
              CircleAvatar(
                radius: 23,
                backgroundColor: theme.primaryColor,
                child: Icon(
                  isEven ? Icons.arrow_forward_ios_outlined:
                  Icons.arrow_back_ios_outlined,
                  size: 25,
                  color: theme.splashColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
