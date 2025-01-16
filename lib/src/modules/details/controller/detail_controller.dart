import 'package:get/get.dart';

import '../details.dart';

class DetailsController extends GetxController {
  final DetailRepository detailRepository = DetailRepository();

  final Rx<DetailModel> detailModel = const DetailModel().obs;

  RxBool isLoading = false.obs;

  final String id;

  DetailsController(this.id);

  @override
  void onInit() {
    super.onInit();
    final id = Get.parameters['id'] ?? '';
    getDetail(id);
  }

  Future<void> getDetail(String id) async {
    isLoading.value = true;
    final detail = await detailRepository.getDetail(id);
    detailModel.value = detail;
    isLoading.value = false;
  }
}
