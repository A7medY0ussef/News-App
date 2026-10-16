import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/modules/layout/data/models/sources/source.dart';
import 'package:news/modules/layout/services/dio_manager.dart';

part 'source_view_model_state.dart';

class SourceViewModelCubit extends Cubit<SourceViewModelState> {
  SourceViewModelCubit() : super(SourceViewModelInitial());

  void getSources(String categoryId) async{
    try{
      emit(SourceViewModelLoading());
      var response =await DioManager.getSources(categoryId);
      if (response.status == 'error') {
        emit(SourceViewModelError(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        emit(SourceViewModeSuccess(sourcesList: response.sources ?? []));
      }  
    }catch(e){
      emit(SourceViewModelError(errorMessage: e.toString()));
    }
  }
}
