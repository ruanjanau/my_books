import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/core.dart';
import 'controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  HomePage({super.key}) {
    Get.put(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Obx(() {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
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
                  ),
                  const SizedBox(height: 20.0),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: controller.isLoading.value
                            ? Center(
                                child: LoadingAnimationWidget.dotsTriangle(
                                  size: 80.0,
                                  color: Colors.blueGrey,
                                ),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Livros encontrados',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Expanded(
                                    child: RefreshIndicator(
                                      onRefresh: () async =>
                                          controller.refreshBooks(),
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
                                                    height: 40.0,
                                                    width: 50.0,
                                                  ),
                                            title: Text(book.title),
                                            subtitle:
                                                Text(book.author.toString()),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
