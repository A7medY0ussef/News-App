import 'package:flutter/material.dart';
import 'package:news/core/utils/size_config.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;
  const MainErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    return Column(
      spacing: height * 0.04,
      children: [
        Text(errorMessage, style: Theme.of(context).textTheme.labelLarge),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(
            'Try Again',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
