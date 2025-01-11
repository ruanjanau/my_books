import 'package:flutter/material.dart';

import '../../../core/core.dart';

class SkeletonBook extends StatelessWidget {
  const SkeletonBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Expanded(
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  DefaultShimmer(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.grey,
                      ),
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
