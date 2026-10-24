import 'package:news/modules/layout/data/models/sources/source_response.dart';
import 'package:news/modules/layout/data/repository/sources/data_source/remote/remote_data_source.dart';
import 'package:news/modules/layout/services/dio_manager.dart';

class RemoteDataSourceDioImplementation implements RemoteDataSource {
  DioManager dioManager;
  RemoteDataSourceDioImplementation({required this.dioManager});
  @override
  Future<SourceResponse> getSources(String categoryId) {
    return dioManager.getSources(categoryId);
  }
}
