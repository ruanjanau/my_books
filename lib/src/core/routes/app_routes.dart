import 'package:get/get.dart';

import '../../modules/modules.dart';
import 'constants/constants.dart';

abstract class AppRoutes {
  static const transiton = Transition.fadeIn;
  static get routes {
    return [
      GetPage(
        name: Routes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding(),
        transition: transiton,
      ),
      GetPage(
        name: Routes.home,
        page: () => HomePage(),
        binding: HomeBinding(),
        transition: transiton,
      ),
      GetPage(
        name: Routes.onboarding,
        page: () => OnboardingPage(),
        binding: OnboardingBinding(),
        transition: transiton,
      ),
      GetPage(
        name: Routes.detail,
        page: () => DetailPage(
          id: Get.parameters['id'] ?? '',
        ),
        binding: DetailsBinding(),
        transition: transiton,
      ),
    ];
  }
}
