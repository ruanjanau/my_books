import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import '../modules.dart';

class FavoritesPage extends StatelessWidget {
  FavoritesPage({super.key}) {
    Get.put(FavoritesController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: GetBuilder<FavoritesController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.bookmark_outlined,
                        color: Colors.white, size: 40),
                    Text(
                      'Meus livros favoritos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return Expanded(
                    child: GridView.builder(
                      itemCount: controller.favoriteBooks.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        final book = controller.favoriteBooks[index];
                        return CardBookFavorite(
                          title: book.title!,
                          author: book.author!.toString(),
                          image: book.thumbnail!,
                          onTap: () => Get.toNamed(Routes.detail, parameters: {
                            'id': book.id!,
                          }),
                        );
                      },
                    ),
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}
