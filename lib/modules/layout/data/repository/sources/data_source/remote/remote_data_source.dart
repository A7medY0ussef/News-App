import 'package:news/modules/layout/data/models/sources/source_response.dart';

abstract class RemoteDataSource {
 Future<SourceResponse> getSources(String categoryId);
}