import 'package:flutter/material.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/view/widgets/category/category_item.dart';

import '../../data/models/category/category_model.dart';

typedef OnCategoryItemClick = void Function(CategoryModel);

class CategoryScreen extends StatelessWidget {
  final OnCategoryItemClick onCategoryItemClick;
  CategoryScreen({super.key, required this.onCategoryItemClick});

  List<CategoryModel> categoriesList = [];

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    final theme = Theme.of(context);
    categoriesList = CategoryModel.categoriesList;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          Text(
            'Good Morning \nHere is Some News For You',
            style: theme.textTheme.headlineLarge,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categoriesList.length,
            ),
          ),
        ],
      ),
    );
  }
}
