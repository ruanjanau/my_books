import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String tittle;
  final double? width;
  final Color? color;
  final VoidCallback? onPressed;
  const PrimaryButton({
    super.key,
    required this.tittle,
    this.width,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            tittle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
