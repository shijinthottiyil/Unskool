import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:unskool/view/screen/screen_signin.dart';
import 'package:unskool/view/widget/onboarding/widget_onboarding.dart';

class ProviderOnboarding with ChangeNotifier {
  final PageController pageController = PageController(
    initialPage: 0,
  );
  final List<Widget> pages = const [
    WidgetOnboarding(
      lottieImg: 'assets/lottie/92377-quiz-mode.json',
      title: 'Take Video Courses',
      subTitle: '  From cooking to coding\nand everything in between',
    ),
    WidgetOnboarding(
      lottieImg: 'assets/lottie/page_two.json',
      title: 'Learn from the best',
      subTitle:
          '  Approachable expert-instructors,\nvetted by more than 50 million learners',
    ),
    WidgetOnboarding(
      lottieImg: 'assets/lottie/page_three.json',
      title: 'Go at Your Own Pace',
      subTitle:
          'Lifetime access to purchased courses\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tanytime,anywhere',
    ),
  ];

  gotoLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: ScreenSignIn(),
        type: PageTransitionType.rightToLeft,
      ),
    );
  }
}
