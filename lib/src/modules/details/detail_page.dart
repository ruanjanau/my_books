import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: GetBuilder<DetailsController>(
          init: DetailsController(id),
          builder: (controller) {
            return SafeArea(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.arrow_back_ios),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.lightBlue,
                              ),
                            ),
                          ],
                        ),
                        ImageBookDetailTile(
                          image:
                              controller.detailModel.value.thumbnail.toString(),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                controller.detailModel.value.title.toString(),
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'USD ${controller.detailModel.value.price.toString()}',
                              style: const TextStyle(
                                color: Colors.green,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            controller.detailModel.value.author.toString(),
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InfoByBookTile(
                              title: 'Publicado',
                              subtitle: controller
                                  .detailModel.value.publishedDate
                                  .toString(),
                            ),
                            InfoByBookTile(
                              title: 'Avaliado',
                              subtitle: controller.detailModel.value.rating
                                  .toString(),
                            ),
                            InfoByBookTile(
                              title: 'Páginas',
                              subtitle: controller.detailModel.value.pageCount
                                  .toString(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        const TabBarTile(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                SingleChildScrollView(
                                  child: Text(
                                    controller.detailModel.value.description!,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.detailModel.value.categories
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TextDimensionsTile(
                                  height: controller.detailModel.value
                                          .dimensions!.height!.isEmpty
                                      ? 'Não informada'
                                      : controller.detailModel.value.dimensions!
                                          .height!,
                                  width: controller.detailModel.value
                                          .dimensions!.width!.isEmpty
                                      ? 'Não informada'
                                      : controller
                                          .detailModel.value.dimensions!.width!,
                                  thickness: controller.detailModel.value
                                          .dimensions!.thickness!.isEmpty
                                      ? 'Não informada'
                                      : controller.detailModel.value.dimensions!
                                          .thickness!,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
