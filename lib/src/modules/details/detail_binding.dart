import 'package:get/get.dart';

import 'details.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut<DetailsController>(() => DetailsController(
        Get.parameters['id'] ?? '',
      ));
}
