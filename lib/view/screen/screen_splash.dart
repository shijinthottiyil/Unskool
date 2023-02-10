import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unskool/utils/const/const_colors.dart';

import '../../controller/provider/provider_splashscreen.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderSplashScreen>(context, listen: false)
        .gotoInitialPage(context);

    return Scaffold(
      body: Column(
        children: const [
          Spacer(flex: 2),
          Center(
            child: Text(
              'Unskool',
              style: TextStyle(
                fontFamily: 'Anton',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          CircularProgressIndicator(
            // backgroundColor: Colors.black,
            color: kPink,
          ),
          Spacer(),
        ],
      ),
    );
  }
}
