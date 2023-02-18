import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unskool/utils/const/const_colors.dart';
import 'package:provider/provider.dart';
import 'package:unskool/controller/provider/provider_onboarding.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<ProviderOnboarding>(builder: (context, value, child) {
      return Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              itemCount: value.pages.length,
              controller: value.pageController,
              itemBuilder: (context, index) {
                return value.pages[index];
              },
            ),
            Align(
              alignment: const Alignment(0, 0.3),
              child: SmoothPageIndicator(
                effect: WormEffect(
                  activeDotColor: kWhite,
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: kWhite.withOpacity(0.5),
                ),
                controller: value.pageController,
                count: value.pages.length,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: kWhite,
                height: height * 0.08,
                width: double.infinity,
                child: Consumer<ProviderOnboarding>(
                    builder: (context, value, child) {
                  return TextButton(
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: kBlack,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      value.gotoLogin(context);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      );
    });
  }
}
