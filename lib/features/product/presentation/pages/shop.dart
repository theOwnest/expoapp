// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:expo_kg/features/product/presentation/cubit/list_grid_type.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';

import '../widgets/appbar_button.dart';
import '../widgets/product_grid.dart';
import '../widgets/shop_comments.dart';

class ShopInfoPage extends StatelessWidget {
  const ShopInfoPage({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;
  @override
  Widget build(BuildContext context) {
    final shop = context.read<ProductCubit>().getById(productId).shop;
    return BlocProvider(
      create: (context) => ListGridType(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: marginHV10,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppbarButtonContainer(
                        icon: 'back',
                        function: () {
                          context.pop();
                        },
                      ),
                      const AppbarButtonContainer(
                        icon: 'upload',
                      ),
                    ],
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shop.name,
                                        style: h24,
                                      ),
                                      Text(
                                        shop.phoneNumber,
                                        style: st14,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: AppColor.lightGrey,
                                      borderRadius: borderRC,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/product/person.png',
                                        width: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              ShopComments(
                                shop: shop,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Товары продавца',
                                    style: h14,
                                  ),
                                  BlocBuilder<ListGridType, ListGridEnum>(
                                    builder: (context, state) {
                                      return GestureDetector(
                                        onTap: () {
                                          context.read<ListGridType>().change();
                                        },
                                        child: Image.asset(
                                          'assets/icons/product/${state.name}.png',
                                          height: state == ListGridEnum.grid
                                              ? 20
                                              : 15,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<ProductCubit, ProductState>(
                          builder: (context, state) {
                            return ProductGrid(
                              products: state.products,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
