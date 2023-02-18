import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unskool/controller/provider/provider_bottomnav.dart';
import 'package:unskool/service/service_user.dart';

class ScreenBottomnav extends StatelessWidget {
  const ScreenBottomnav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerWL = Provider.of<ProviderBottomnav>(context);
    return Scaffold(
      body: providerWL.pages.elementAt(providerWL.selectedIndex),
      bottomNavigationBar:
          Consumer<ProviderBottomnav>(builder: (context, value, child) {
        return BottomNavigationBar(
          currentIndex: value.selectedIndex,
          onTap: (data) {
            value.onTapFn(data);
            // log(value.selectedIndex.toString());
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(
                value.selectedIndex == 0
                    ? FontAwesomeIcons.solidStar
                    : FontAwesomeIcons.star,
              ),
              label: 'Featured',
            ),
            const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                value.selectedIndex == 2
                    ? FontAwesomeIcons.solidCirclePlay
                    : FontAwesomeIcons.circlePlay,
              ),
              label: 'My learning',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                value.selectedIndex == 3
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
              ),
              label: "Wishlist",
            ),
            BottomNavigationBarItem(
              icon: FaIcon(
                value.selectedIndex == 4
                    ? FontAwesomeIcons.solidUser
                    : FontAwesomeIcons.user,
              ),
              label: "Account",
            ),
          ],
        );
      }),
    );
  }
}
