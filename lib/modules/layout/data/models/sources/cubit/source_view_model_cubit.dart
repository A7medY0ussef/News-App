import 'package:bloc/bloc.dart';
import 'package:news/modules/layout/data/models/sources/source.dart';
import 'package:news/modules/layout/data/repository/sources/repository/source_repository.dart';

part 'source_view_model_state.dart';

class SourceViewModelCubit extends Cubit<SourceViewModelState> {
  late SourceRepository sourceRepository;

  SourceViewModelCubit({required this.sourceRepository})
    : super(SourceViewModelInitial());

  void getSources(String categoryId) async {
    try {
      emit(SourceViewModelLoading());
      var response = await sourceRepository.getSources(categoryId);
      if (response.status == 'error') {
        emit(SourceViewModelError(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        emit(SourceViewModeSuccess(sourcesList: response.sources ?? []));
      }
    } catch (e) {
      emit(SourceViewModelError(errorMessage: e.toString()));
    }
  }
}
