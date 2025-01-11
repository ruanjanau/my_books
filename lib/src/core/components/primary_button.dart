import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String tittle;
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    required this.tittle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        tittle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
