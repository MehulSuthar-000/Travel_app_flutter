import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  List text = [
    'mountain heights give you an incredible sense of freedom along with endurance test',
    'Snow, a whimsical blanket of white, Transforms the world with enchanting delight.',
    "On the river's surface, a snowy quilt unfolds, Nature's winter masterpiece, serene and cold.",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/" + images[index],
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(
                        text: 'Trips',
                      ),
                      const AppText(
                        text: 'Mountain',
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 250,
                        child: AppText(
                          text: text[index],
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ResponsiveButton(
                        width: 120,
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexSlider) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index == indexSlider ? 25 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexSlider
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.3),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
        scrollDirection: Axis.vertical,
        itemCount: images.length,
      ),
    );
  }
}
