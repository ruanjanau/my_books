import 'package:flutter/material.dart';

class TextDimensionsTile extends StatelessWidget {
  final String height;
  final String width;
  final String thickness;
  const TextDimensionsTile({
    super.key,
    required this.height,
    required this.width,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Altura: ${height}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Largura: ${width}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          'Espessura: ${thickness}',
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
