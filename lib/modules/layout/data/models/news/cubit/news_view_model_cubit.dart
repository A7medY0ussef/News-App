import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/modules/layout/data/models/news/articles.dart';
import 'package:news/modules/layout/services/dio_manager.dart';

part 'news_view_model_state.dart';

class NewsViewModelCubit extends Cubit<NewsViewModelState> {
  NewsViewModelCubit() : super(NewsViewModelInitial());

  void getNews(String sourceId) async{
    try{
      var response = await DioManager.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsViewModelError(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        emit(NewsViewModelSuccess(newsList: response.articles ?? []));
      }
    }catch(e){
      emit(NewsViewModelError(errorMessage: e.toString()));
    }
  }
}
