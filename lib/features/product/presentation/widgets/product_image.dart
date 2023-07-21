import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expo_kg/features/product/presentation/cubit/product_cont.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: 'image ${context.read<ProductController>().state.id}',
          child: CarouselSlider(
            items: context
                .read<ProductController>()
                .state
                .images
                .map(
                  (e) => ProductImageSliderContainer(
                    image: e,
                  ),
                )
                .toList(),
            carouselController: controller,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: 240.h,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            context.read<ProductController>().state.images.length,
            (index) => GestureDetector(
              onTap: () => controller.animateToPage(index),
              child: Container(
                width: 6.0,
                height: 6.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(
                    _current == index ? 0.9 : 0.4,
                  ),
                ),
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}

class ProductImageSliderContainer extends StatelessWidget {
  const ProductImageSliderContainer({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      margin: marginH,
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: borderR6,
      ),
      child: Image.asset(
        image,
      ),
    );
  }
}
