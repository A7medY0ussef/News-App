import 'package:news/modules/layout/data/models/sources/source_response.dart';
import 'package:news/modules/layout/data/repository/sources/data_source/remote/remote_data_source.dart';
import 'package:news/modules/layout/data/repository/sources/repository/source_repository.dart';

class SourceRepositoryImplementation implements SourceRepository {
  RemoteDataSource remoteDataSource;
  SourceRepositoryImplementation({required this.remoteDataSource});
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    var sourceResponse = await remoteDataSource.getSources(categoryId);
    return sourceResponse;
  }
}
