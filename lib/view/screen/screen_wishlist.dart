import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:unskool/utils/const/const_colors.dart';

class ScreenWishlist extends StatelessWidget {
  ScreenWishlist({super.key});
  List<int> sample = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: textStyle.titleMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.cartShopping,
              color: kWhite,
            ),
          ),
        ],
      ),
      body: sample.isNotEmpty
          ? ListView.separated(
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 200,
                  child: Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: Placeholder(),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: sample.length,
            )
          : Center(
              child: Lottie.asset('assets/lottie/empty_cart.json'),
            ),
    );
  }
}
