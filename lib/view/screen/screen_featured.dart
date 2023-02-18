import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:unskool/controller/provider/provider_featured.dart';
import 'package:unskool/utils/const/const_colors.dart';
import 'package:unskool/utils/const/const_sizedbox.dart';
import 'package:unskool/utils/const/const_textstyle.dart';
import 'package:unskool/view/widget/featured/featured_text.dart';

class ScreenFeatured extends StatelessWidget {
  const ScreenFeatured({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderFeature>(context, listen: false).getName();

    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.cartShopping),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  color: kWhite.withOpacity(0.3),
                  size: 50,
                ),
                kWidth10,
                Consumer<ProviderFeature>(builder: (context, value, child) {
                  return Text(
                    value.name != null ? 'Welcome ${value.name}' : 'Loading',
                    style: Theme.of(context).textTheme.labelMedium,
                  );
                }),
              ],
            ),
            kHeight10,
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/homepage.png',
                fit: BoxFit.contain,
              ),
            ),
            kHeight5,
            const FeaturedText(
              text: 'Skills for your future',
              textStyle: TextStyle(
                fontFamily: 'Abhaya Libre',
                fontSize: 36,
              ),
            ),
            const FeaturedText(
              text:
                  'Expand your potential with a course for as  little as 449 rs.',
              textStyle: textStyleSml,
            ),
            kHeight15,
            FeaturedText(
              text: 'Recommended for you',
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            kHeight5,
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200,
                    child: Card(
                      color: kBlack,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/courseimage.jpg',
                            fit: BoxFit.cover,
                          ),
                          kHeight5,
                          Text(
                            'Full JavaScript Course',
                            style: kInterBold12,
                          ),
                          kHeight5,
                          Text(
                            'Angela Yu',
                            style: kInterSize10,
                          ),
                          kHeight5,
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: '⭐ '),
                                TextSpan(
                                  text: '9/10',
                                  style: kInterSize10,
                                ),
                              ],
                            ),
                          ),
                          kHeight5,
                          Text(
                            '₹449',
                            style: kInterBold12,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
            kHeight15,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See all',
                    style: textStyleSmlPurple,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ActionChip(
                    backgroundColor: kBlack,
                    label: Text('Text'),
                    onPressed: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return kWidth10;
                },
              ),
            ),
            kHeight15,
            Text(
              "All courses",
              style: textStyle.labelLarge,
            ),
            kHeight5,
            SizedBox(
              height: 500,
              child: GridView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card();
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
