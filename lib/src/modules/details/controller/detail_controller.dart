import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../modules.dart';

class DetailsController extends GetxController {
  final DetailRepository detailRepository = DetailRepository();
  final FavoritesController favoriteService = Get.find();

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

  Future<void> openWebReader() async {
    isLoading.value = true;
    final url = detailModel.value.webReaderLink;
    final uri = Uri.parse(url ?? '');
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
    isLoading.value = false;
  }

  Future<void> getDetail(String id) async {
    isLoading.value = true;
    final detail = await detailRepository.getDetail(id);
    detailModel.value = detail;
    isLoading.value = false;
  }

  void toggleFavorite() {
    if (favoriteService.isFavorite(detailModel.value)) {
      favoriteService.removeFromFavorites(detailModel.value);
    } else {
      favoriteService.addToFavorites(detailModel.value);
    }
    update();
  }
}
