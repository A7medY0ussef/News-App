import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/services/url_helper.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/theme/app_styles.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/data/models/news/articles.dart';
import 'package:news/modules/layout/view/widgets/main_loading_widget.dart';

class ArticleBottomSheet extends StatelessWidget {
  final Articles articles;
  const ArticleBottomSheet({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(width * 0.04),
        padding: EdgeInsets.all(width * 0.02),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: articles.urlToImage ?? '',
                placeholder: (context, url) => MainLoadingWidget(),
                errorWidget: (context, url, error) => SizedBox(
                  height: height * 0.25,
                  child: Center(child: Icon(Icons.error)),
                ),
                width: double.infinity,
                height: height * 0.25,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(articles.description ?? '', style: AppStyles.medium14Black),
            SizedBox(height: height * 0.015),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blackColor,
                  foregroundColor: AppColors.whiteColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: height * 0.012),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onPressed: () => openArticle(context),
                child: const Text('View Full Article'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> openArticle(BuildContext context) async {
    final url = articles.url;
    if (url == null || url.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Sorry, no data')));
      return;
    }
    final urlIsOpened = await UrlHelper.openUrl(url);
    if (!urlIsOpened && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open the link')));
    }
  }
}
