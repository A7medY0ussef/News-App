import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/di/di.dart';
import 'package:news/modules/layout/data/models/sources/cubit/source_view_model_cubit.dart';
import 'package:news/modules/layout/view/widgets/main_error_widget.dart';
import 'package:news/modules/layout/view/widgets/main_loading_widget.dart';
import 'package:news/modules/layout/view/widgets/sources/source_tab_widget.dart';

import '../../data/models/category/category_model.dart';

class ArticlesScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const ArticlesScreen({super.key, required this.categoryModel});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    viewModel.getSources(widget.categoryModel.id);
    super.initState();
  }

  SourceViewModelCubit viewModel = SourceViewModelCubit(
    sourceRepository: injectSourceRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModelCubit, SourceViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceViewModeSuccess) {
          var sourcesList = state.sourcesList;
          return SourceTab(sourcesList: sourcesList);
        } else if (state is SourceViewModelError) {
          return MainErrorWidget(
            errorMessage: state.errorMessage,
            onPressed: () {
              viewModel.getSources(widget.categoryModel.id);
            },
          );
        } else {
          return MainLoadingWidget();
        }
      },
    );
  }
}
