import 'package:news/modules/layout/data/models/news/news_response.dart';

abstract class NewsRepository {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
  Future<NewsResponse> searchNews(String query);
}
