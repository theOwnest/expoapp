// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:expo_kg/features/home/data/models/product.dart';

class ProductGallery extends StatefulWidget {
  const ProductGallery({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  final galleryController = CarouselController();
  final smallController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: marginHV10,
              child: AppbarBackButton(),
            ),
            Expanded(
              child: CarouselSlider(
                items: widget.product.images
                    .map(
                      (e) => Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: marginH,
                        decoration: BoxDecoration(
                          color: AppColor.lightGrey,
                          borderRadius: borderR6,
                        ),
                        child: Center(
                          child: Image.asset(
                            e,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: galleryController,
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: double.infinity,
                  onPageChanged: (index, reason) {
                    smallController.animateToPage(index);
                  },
                ),
              ),
            ),
            Container(
              height: 140.h,
              width: double.infinity,
              padding: marginV,
              child: CarouselSlider(
                items: List.generate(
                  widget.product.images.length,
                  (index) => GestureDetector(
                    onTap: () {
                      smallController.animateToPage(index);
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      margin: marginH,
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: borderR6,
                      ),
                      child: Center(
                        child: Image.asset(
                          widget.product.images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                carouselController: smallController,
                options: CarouselOptions(
                  viewportFraction: 1 / 3,
                  onPageChanged: (index, reason) {
                    galleryController.animateToPage(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
