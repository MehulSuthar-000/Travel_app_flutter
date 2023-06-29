import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('img/mountain.jpeg'),
                        fit: BoxFit.cover),
                  )),
            ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 280,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        AppLargeText(
                          text: 'Yosemite',
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 170,
                        ),
                        AppLargeText(
                          text: '\$200',
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: 'India, Maharashtra',
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index <= gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor1,
                            );
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: '(4.0)',
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AppLargeText(
                      text: 'People',
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const AppText(
                      text: 'Number of people in your group?',
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButton(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backGroundColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              size: 50,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : AppColors.buttonBackground,
                              isIcon: false,
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: 'Description',
                      color: Colors.black.withOpacity(0.8),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          'You must go for a travel. Travelling gelps get rid of pressure. Go to the mountains to see the nature.',
                      color: AppColors.mainTextColor,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppButton(
                      color: AppColors.textColor1,
                      backGroundColor: Colors.white,
                      size: 60,
                      borderColor: AppColors.textColor2,
                      icon: Icons.favorite_border,
                      isIcon: true,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
