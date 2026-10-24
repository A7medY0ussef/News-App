import 'package:flutter/material.dart';
import 'package:news/modules/layout/data/models/category/category_model.dart';
import 'package:news/modules/layout/view/screens/articles_screen.dart';
import 'package:news/modules/layout/view/screens/category_screen.dart';
import 'package:news/modules/layout/view/screens/search_screen.dart';
import 'package:news/modules/layout/view/widgets/drawer/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

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
          if (selectedCategory != null)
            IconButton(
              onPressed: openSearch,
              icon: Icon(Icons.search_outlined, color: theme.splashColor),
            ),
        ],
      ),
      drawer: DrawerWidget(onTap: onTapDrawer),
      body: selectedCategory == null
          ? CategoryScreen(onCategoryItemClick: onCategoryItemClick)
          : ArticlesScreen(categoryModel: selectedCategory!),
    );
  }

  void openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SearchScreen()),
    );
  }

  void onCategoryItemClick(CategoryModel newCategory) {
    setState(() => selectedCategory = newCategory);
  }

  void onTapDrawer() {
    Navigator.pop(context);
    setState(() => selectedCategory = null);
  }
}