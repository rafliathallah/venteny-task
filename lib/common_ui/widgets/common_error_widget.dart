import 'package:flutter/material.dart';

class CommonErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const CommonErrorWidget({
    required this.errorMessage,
    required this.onRetry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Error $errorMessage"),
        TextButton(
          onPressed: onRetry,
          child: const Text('Kembali'),
        ),
      ],
    );
  }
}
