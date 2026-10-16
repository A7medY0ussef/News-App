import 'package:news/core/theme/app_assets.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  CategoryModel({required this.id, required this.title, required this.image});

  static List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 'general',
      title: 'General',
      image: AppAssets.generalImage,
    ),
    CategoryModel(
      id: 'business',
      title: 'Business',
      image: AppAssets.businessImage,
    ),
    CategoryModel(id: 'sports', title: 'Sports', image: AppAssets.sportsImage),
    CategoryModel(
      id: 'technology',
      title: 'Technology',
      image: AppAssets.technologyImage,
    ),
    CategoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      image: AppAssets.entertainmentImage,
    ),
    CategoryModel(id: 'health', title: 'Health', image: AppAssets.healthImage),
    CategoryModel(
      id: 'science',
      title: 'Science',
      image: AppAssets.scienceImage,
    ),
  ];
}
