import 'package:get/get.dart';

import '../modules.dart';

class FavoritesBindings implements Bindings {
  @override
  void dependencies() => Get.lazyPut(() => FavoritesController());
}
