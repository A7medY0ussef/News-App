import 'package:dio/dio.dart';
import 'package:news/core/constant/api_constant.dart';
import 'package:news/core/constant/api_end_point.dart';
import 'package:news/modules/layout/data/models/news/news_response.dart';
import 'package:news/modules/layout/data/models/sources/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  static final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: 'https://newsapi.org',
            connectTimeout: Duration(seconds: 5),
            receiveTimeout: Duration(seconds: 3),
            queryParameters: {'apiKey': ApiConstant.apiKey},
          ),
        )
        ..interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
          ),
        );

  Future<SourceResponse> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        ApiEndPoint.sourceApi,
        queryParameters: {'category': categoryId},
      );
      return SourceResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        ApiEndPoint.newsApi,
        queryParameters: {'sources': sourceId},
      );
      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> searchNews(String query) async {
    try {
      var response = await dio.get(
        ApiEndPoint.newsApi,
        queryParameters: {'q': query},
      );
      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
