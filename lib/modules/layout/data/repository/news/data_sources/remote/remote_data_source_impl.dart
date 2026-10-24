import 'package:news/modules/layout/data/models/news/news_response.dart';
import 'package:news/modules/layout/data/repository/news/data_sources/remote/remote_data_source.dart';
import 'package:news/modules/layout/services/dio_manager.dart';

class RemoteDataSourceDioImpl implements RemoteDataSource {
  DioManager dioManager;
  RemoteDataSourceDioImpl({required this.dioManager});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    var newResponse = await dioManager.getNewsBySourceId(sourceId);
    return newResponse;
  }

  @override
  Future<NewsResponse> searchNews(String query) async {
    var newsResponse = await dioManager.searchNews(query);
    return newsResponse;
  }
}
