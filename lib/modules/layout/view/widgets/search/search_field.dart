import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClose;
  final ValueChanged<String>? onSubmitted;

  const SearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClose,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      autofocus: true,
      style: theme.textTheme.headlineMedium?.copyWith(
        height: 1.5,
        letterSpacing: -0.44,
      ),
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search, size: 24),
        suffixIcon: IconButton(
          onPressed: onClose,
          icon: const Icon(Icons.close, size: 24),
        ),
      ),
    );
  }
}
