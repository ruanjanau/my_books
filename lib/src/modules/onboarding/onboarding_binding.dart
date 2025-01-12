import 'package:get/get.dart';

import 'onboarding.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => const OnboardingPage());
}
