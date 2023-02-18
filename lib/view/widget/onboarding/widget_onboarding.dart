import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WidgetOnboarding extends StatelessWidget {
  final String lottieImg;
  final String title;
  final String subTitle;
  const WidgetOnboarding({
    super.key,
    required this.lottieImg,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: height * 0.5,
              child: Lottie.asset(
                lottieImg,
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subTitle,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
