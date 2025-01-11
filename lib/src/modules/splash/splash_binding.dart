import 'package:get/get.dart';
import 'package:my_books/src/modules/modules.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const SplashPage());
  }
}
