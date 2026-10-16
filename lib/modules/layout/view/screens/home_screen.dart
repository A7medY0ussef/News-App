import 'package:flutter/material.dart';
import 'package:news/modules/layout/data/models/category/category_model.dart';
import 'package:news/modules/layout/view/screens/articles_screen.dart';
import 'package:news/modules/layout/view/screens/category_screen.dart';

import '../widgets/drawer/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: theme.textTheme.headlineMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search_outlined, color: theme.splashColor),
          ),
        ],
      ),
      drawer: DrawerWidget(onTap: () => onTapDrawer()),
      body: selectedCategory == null
          ? CategoryScreen(onCategoryItemClick: onCategoryItemClick)
          : ArticlesScreen(categoryModel: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }

  void onTapDrawer() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
