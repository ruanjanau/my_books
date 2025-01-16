import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_books/src/modules/details/controller/controllers.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<DetailsController>(
          init: DetailsController(id),
          builder: (controller) {
            return SafeArea(
              child: Obx(() {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(controller
                              .detailModel.value.thumbnail
                              .toString()),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          }),
    );
  }
}
