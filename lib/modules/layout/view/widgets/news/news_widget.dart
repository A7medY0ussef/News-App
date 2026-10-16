import 'package:flutter/material.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/data/models/news/news_model_view.dart';
import 'package:news/modules/layout/view/widgets/main_error_widget.dart';
import 'package:news/modules/layout/view/widgets/main_loading_widget.dart';
import 'package:news/modules/layout/view/widgets/news/news_item.dart';
import 'package:provider/provider.dart';

import '../../../data/models/sources/source.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {

  NewsModelView viewModel = NewsModelView();
  @override
  void initState() {
    // TODO: implement initState
    viewModel.getNews(widget.source.id ?? '');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsModelView>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return MainLoadingWidget();
          } else if (viewModel.errorMessage != null) {
            return MainErrorWidget(
              errorMessage: viewModel.errorMessage!,
              onPressed: () {
                viewModel.getNews(widget.source.id ?? '');
              },
            );
          } else if (viewModel.newsList == null) {
            return MainLoadingWidget();
          } else {
            var newsList = viewModel.newsList ?? [];
            return newsList.isEmpty
                ? Text('No News Found', style: theme.textTheme.headlineLarge)
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return NewsItem(articles: newsList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: context.height * 0.02);
                    },
                    itemCount: newsList.length,
                  );
          }
        },
      ),
    );
  }
}
