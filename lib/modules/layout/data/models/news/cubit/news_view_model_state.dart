part of 'news_view_model_cubit.dart';

@immutable
sealed class NewsViewModelState {}

final class NewsViewModelInitial extends NewsViewModelState {}
final class NewsViewModelLoading extends NewsViewModelState {}
final class NewsViewModelSuccess extends NewsViewModelState {
  List<Articles> newsList;
  NewsViewModelSuccess({required this.newsList});
}
final class NewsViewModelError extends NewsViewModelState {
  String errorMessage;
  NewsViewModelError({required this.errorMessage});
}
