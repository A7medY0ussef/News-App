import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/data/models/news/articles.dart';
import 'package:news/modules/layout/view/widgets/main_loading_widget.dart';

class NewsItem extends StatelessWidget {
  final Articles articles;
  const NewsItem({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var width = context.width;
    var height = context.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.whiteColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: height * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage ?? '',
              placeholder: (context, url) => MainLoadingWidget(),
              errorWidget: (context, url, error) => Center(child: Icon(Icons.error,color: Colors.red,)),
            ),
          ),
          Text(articles.title ?? '', style: theme.textTheme.labelLarge),
          SizedBox(height: height * 0.01),
          Row(
            children: [
              Expanded(
                child: Text(
                  'By: ${articles.author ?? 'unknown'}',
                  style: theme.textTheme.labelSmall,
                ),
              ),
              Text(
                '${DateFormat('mm').format(DateTime.parse(articles.publishedAt ?? ''))} minutes',
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
