import 'package:get/get.dart';

import '../../modules/modules.dart';
import 'navigation.dart';

class NavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationPage());
    Get.put(FavoritesController());
  }
}
