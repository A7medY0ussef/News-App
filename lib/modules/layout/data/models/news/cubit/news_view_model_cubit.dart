import 'package:bloc/bloc.dart';
import 'package:news/modules/layout/data/models/news/articles.dart';
import 'package:news/modules/layout/data/repository/news/repository/news_repository.dart';

part 'news_view_model_state.dart';

class NewsViewModelCubit extends Cubit<NewsViewModelState> {
  NewsRepository newsRepository;
  NewsViewModelCubit({required this.newsRepository})
    : super(NewsViewModelInitial());

  void getNews(String sourceId) async {
    try {
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsViewModelError(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        emit(NewsViewModelSuccess(newsList: response.articles ?? []));
      }
    } catch (e) {
      emit(NewsViewModelError(errorMessage: e.toString()));
    }
  }

  void searchNews(String query) async {
    emit(NewsViewModelLoading());
    try {
      var response = await newsRepository.searchNews(query);
      if (response.status == 'error') {
        emit(NewsViewModelError(errorMessage: response.message ?? 'An error occurred'));
      }
      if (response.status == 'ok') {
        emit(NewsViewModelSuccess(newsList: response.articles ?? []));
      }
    } catch (e) {
      emit(NewsViewModelError(errorMessage: e.toString()));
    }
  }
}
