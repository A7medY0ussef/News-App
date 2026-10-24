import 'package:news/modules/layout/data/repository/news/data_sources/remote/remote_data_source.dart'
    as news_ds;
import 'package:news/modules/layout/data/repository/news/data_sources/remote/remote_data_source_impl.dart';
import 'package:news/modules/layout/data/repository/news/repository/news_repository.dart';
import 'package:news/modules/layout/data/repository/news/repository/news_repository_impl.dart';

import 'package:news/modules/layout/data/repository/sources/data_source/remote/remote_data_source.dart'
    as sources_ds;
import 'package:news/modules/layout/data/repository/sources/data_source/remote/remote_data_source_implementation.dart';
import 'package:news/modules/layout/data/repository/sources/repository/source_repository.dart';
import 'package:news/modules/layout/data/repository/sources/repository/source_repository_implementation.dart';
import 'package:news/modules/layout/services/dio_manager.dart';

SourceRepository injectSourceRepository() {
  return SourceRepositoryImplementation(
    remoteDataSource: injectSourceRemoteDataSource(),
  );
}

sources_ds.RemoteDataSource injectSourceRemoteDataSource() {
  return RemoteDataSourceDioImplementation(dioManager: injectDioManager());
}

DioManager injectDioManager() {
  return DioManager();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(remoteDataSource: injectNewsRemoteDataSource());
}

news_ds.RemoteDataSource injectNewsRemoteDataSource() {
  return RemoteDataSourceDioImpl(dioManager: injectDioManager());
}
