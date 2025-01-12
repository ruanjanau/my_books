import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String tittle;
  final Color? color;
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    required this.tittle,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color ?? Colors.blue),
      onPressed: onPressed,
      child: Text(
        tittle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
