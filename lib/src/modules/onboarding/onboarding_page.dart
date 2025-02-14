import 'package:flutter/material.dart';
import 'package:flutter_carousel_intro/flutter_carousel_intro.dart';
import 'package:flutter_carousel_intro/slider_item_model.dart';
import 'package:flutter_carousel_intro/utils/enums.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../core/core.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: FlutterCarouselIntro(
          indicatorAlign: IndicatorAlign.bottom,
          showIndicators: true,
          primaryColor: Colors.blueGrey,
          slides: [
            SliderItem(
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.blueGrey,
              ),
              title: 'Bem vindo ao Booksbury!',
              subtitle: const Text(
                textAlign: TextAlign.center,
                AppStrings.onboardingNumberOne,
                style: TextStyle(fontSize: 16.0,
                ),
              ),
              widget: SvgPicture.asset(Assets.onboardingOne),
            ),
            SliderItem(
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.blueGrey,
              ),
              title: 'Benefícios deste aplicativo',
              subtitle: const Text(
                textAlign: TextAlign.center,
                AppStrings.onboardingNumberTwo,
                style: TextStyle(fontSize: 16.0),
              ),
              widget: SvgPicture.asset(Assets.onboardingThree),
            ),
            SliderItem(
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.blueGrey,
              ),
              title: 'Está pronto para começar a ler? Então, vamos começar...',
              widget: SvgPicture.asset(Assets.onboardingTwo),
              subtitle: PrimaryButton(
                color: Colors.blueGrey,
                tittle: 'Vamos lá!',
                onPressed: () => Get.offAllNamed(Routes.navigation),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
