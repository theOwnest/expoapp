// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/features/product/presentation/cubit/product_cont.dart';
import 'package:expo_kg/features/product/presentation/widgets/appbar_button.dart';
import 'package:expo_kg/features/product/presentation/widgets/product_image.dart';
import 'package:expo_kg/features/product/presentation/widgets/product_specs.dart';
import 'package:expo_kg/features/product/presentation/widgets/shop_container.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';

import 'package:expo_kg/features/home/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductController(product),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: marginHV10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppbarButtonContainer(
                      icon: 'back',
                      function: () {
                        context.pop();
                      },
                    ),
                    Row(
                      children: [
                        AppbarButtonContainer(
                          icon: 'upload',
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        AppbarButtonContainer(
                          icon: 'heart',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProductImageSlider(),
                      Padding(
                        padding: marginH,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: h18,
                            ),
                            ProductShopContainer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Описание',
                                  style: h14,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  product.description,
                                  style: st14,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ProductSpecs(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
