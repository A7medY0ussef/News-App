import 'package:news/modules/layout/data/models/news/news_response.dart';
import 'package:news/modules/layout/data/repository/news/data_sources/remote/remote_data_source.dart';
import 'package:news/modules/layout/data/repository/news/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  RemoteDataSource remoteDataSource;
  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    var newsResponse = await remoteDataSource.getNewsBySourceId(sourceId);
    return newsResponse;
  }

  @override
  Future<NewsResponse> searchNews(String query) async {
    var newsResponse = await remoteDataSource.searchNews(query);
    return newsResponse;
  }
}
