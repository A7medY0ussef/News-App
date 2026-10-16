import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/utils/size_config.dart';
import 'package:news/modules/layout/data/models/sources/source.dart';
import 'package:news/modules/layout/view/widgets/news/news_widget.dart';

import 'source_name.dart';

class SourceTab extends StatefulWidget {
  final List<Sources> sourcesList;

  const SourceTab({super.key, required this.sourcesList});

  @override
  State<SourceTab> createState() => _SourceTabState();
}

class _SourceTabState extends State<SourceTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var height = context.height;
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: SafeArea(
        child: Column(
          spacing: height * 0.02,
          children: [
            TabBar(
              isScrollable: true,
              dividerColor: AppColors.transparentColor,
              indicatorColor: theme.splashColor,
              tabAlignment: TabAlignment.start,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourcesList.map((source) {
                return SourceName(
                  source: source,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(source),
                );
              }).toList(),
            ),
            Expanded(child: NewsWidget(
                key: ValueKey(widget.sourcesList[selectedIndex].id),
                source: widget.sourcesList[selectedIndex]))
          ],
        ),
      ),
    );
  }
}
