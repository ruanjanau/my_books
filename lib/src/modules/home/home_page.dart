import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/core.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(Assets.book, height: 30),
                      const Text(
                        'Booksbury',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Digite o nome do livro...',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              controller.searchBooks(_searchController.text);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(thickness: 1, color: Colors.blueGrey),
                  const SizedBox(height: 10),
                  const Text(
                    'Livros encontrados',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                    ),
                  ),
                  controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: controller.books.length,
                            itemBuilder: (context, index) {
                              final book = controller.books[index];
                              return ListTile(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.detail,
                                    parameters: {'id': book.id},
                                  );
                                },
                                leading: book.thumbnail.isNotEmpty
                                    ? Image.network(book.thumbnail)
                                    : SvgPicture.asset(
                                        Assets.book,
                                        height: 40,
                                        width: 50,
                                      ),
                                title: Text(book.title),
                                subtitle: Text(book.author.toString()),
                              );
                            },
                          ),
                        ),
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
