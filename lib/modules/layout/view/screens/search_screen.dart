import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news/core/di/di.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/data/models/news/articles.dart';
import 'package:news/modules/layout/data/repository/news/repository/news_repository.dart';
import 'package:news/modules/layout/view/widgets/main_error_widget.dart';
import 'package:news/modules/layout/view/widgets/main_loading_widget.dart';
import 'package:news/modules/layout/view/widgets/news/news_item.dart';
import 'package:news/modules/layout/view/widgets/search/search_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  final NewsRepository _newsRepository = injectNewsRepository();
  final List<Articles> results = [];

  Timer? _debounce;
  bool isLoading = false;
  String? errorMessage;
  String _lastQuery = '';

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void closeSearch() {
    searchController.clear();
    Navigator.pop(context);
  }

  void onSearchChanged(String value) {
    _debounce?.cancel();
    final query = value.trim();

    if (query.isEmpty) {
      setState(() {
        results.clear();
        isLoading = false;
        errorMessage = null;
        _lastQuery = '';
      });
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () => search(query));
  }

  void onSearchSubmitted(String value) {
    _debounce?.cancel();
    final query = value.trim();
    if (query.isNotEmpty) {
      search(query);
    }
  }

  Future<void> search(String query) async {
    _lastQuery = query;
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await _newsRepository.searchNews(query);

      // Ignore response if the query changed while waiting for API
      if (!mounted || query != _lastQuery) return;

      if (response.status == 'ok') {
        setState(() {
          results
            ..clear()
            ..addAll(response.articles ?? []);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = response.message ?? 'Something went wrong, please try again';
        });
      }
    } catch (e) {
      if (!mounted || query != _lastQuery) return;
      setState(() {
        isLoading = false;
        errorMessage = 'Something went wrong, please try again';
      });
    }
  }

  Widget _buildBody(double height, ThemeData theme) {
    if (isLoading) {
      return const MainLoadingWidget();
    }
    if (errorMessage != null) {
      return Center(
        child: MainErrorWidget(
          errorMessage: errorMessage!,
          onPressed: () {
            if (_lastQuery.isNotEmpty) {
              search(_lastQuery);
            }
          },
        ),
      );
    }
    if (results.isEmpty && searchController.text.trim().isNotEmpty) {
      return Center(
        child: Text(
          'No results found',
          style: theme.textTheme.headlineMedium,
        ),
      );
    }
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (_, _) => SizedBox(height: height * 0.02),
      itemBuilder: (_, index) => NewsItem(articles: results[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = context.width;
    final height = context.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.01,
              ),
              child: SearchField(
                controller: searchController,
                onChanged: onSearchChanged,
                onSubmitted: onSearchSubmitted,
                onClose: closeSearch,
              ),
            ),
            Expanded(child: _buildBody(height, theme)),
          ],
        ),
      ),
    );
  }
}
