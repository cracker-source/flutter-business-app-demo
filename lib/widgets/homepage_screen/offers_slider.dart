import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social/utils/colors.dart';

class OffersSlider extends StatefulWidget {
  const OffersSlider({super.key});

  @override
  State<OffersSlider> createState() => _OffersSliderState();
}

class _OffersSliderState extends State<OffersSlider> {
  int _activeSliderValue = 0;

  void sliderHandler(int index, reason) {
    setState(() {
      _activeSliderValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            Image.asset('assets/ad.png'),
            Image.asset('assets/ad.png'),
            Image.asset('assets/ad.png'),
          ],
          options: CarouselOptions(
            initialPage: _activeSliderValue,
            enableInfiniteScroll: true,
            reverse: false,
            // autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
            onPageChanged: sliderHandler,
          ),
        ),
        const SizedBox(height: 5),
        AnimatedSmoothIndicator(
          activeIndex: _activeSliderValue,
          count: 3,
          effect: WormEffect(
            dotHeight: 5,
            dotWidth: 5,
            activeDotColor: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
