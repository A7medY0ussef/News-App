part of 'source_view_model_cubit.dart';

sealed class SourceViewModelState {}

final class SourceViewModelInitial extends SourceViewModelState {}

final class SourceViewModelLoading extends SourceViewModelState {}

final class SourceViewModeSuccess extends SourceViewModelState {
  List<Sources> sourcesList;
  SourceViewModeSuccess({required this.sourcesList});
}

final class SourceViewModelError extends SourceViewModelState {
  String errorMessage;
  SourceViewModelError({required this.errorMessage});
}
