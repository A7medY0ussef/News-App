import 'package:flutter/material.dart';


import '../../../data/models/sources/source.dart';

class SourceName extends StatelessWidget {
  final Sources source;
  final bool isSelected;
  const SourceName({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      source.name ?? '',
      style: isSelected
          ? theme.textTheme.labelLarge
          : theme.textTheme.labelMedium,
    );
  }
}
