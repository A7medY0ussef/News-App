import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/data/models/news/cubit/news_view_model_cubit.dart';
import 'package:news/modules/layout/view/widgets/news/news_item.dart';

import '../../../data/models/sources/source.dart';
import '../main_error_widget.dart';
import '../main_loading_widget.dart';

class NewsWidget extends StatefulWidget {
  final Sources source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModelCubit viewModel = NewsViewModelCubit();
  @override
  void initState() {
    viewModel.getNews(widget.source.id ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<NewsViewModelCubit, NewsViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsViewModelSuccess) {
          var newsList = state.newsList;
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
        } else if (state is NewsViewModelError) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              viewModel.getNews(widget.source.id ?? '');
            },
          );
        } else {
          return MainLoadingWidget();
        }
      },
    );
  }
}
