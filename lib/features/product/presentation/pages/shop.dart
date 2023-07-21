import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/widgets/product_container.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/border_radius.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import '../widgets/appbar_button.dart';
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Товары продавца',
                                style: h14,
                              ),
                              Image.asset(
                                'assets/icons/product/grid.png',
                                height: 20,
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
                        return SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 168 / 254,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => ProductContainer(
                            product: state.products[index],
                          ),
                          itemCount: state.products.length,
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
  }
}
