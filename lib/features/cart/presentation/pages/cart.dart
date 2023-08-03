import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:expo_kg/features/cart/presentation/widgets/cart_items_grid.dart';
import 'package:expo_kg/features/cart/presentation/widgets/cart_recommended_container.dart';
import 'package:expo_kg/features/cart/presentation/widgets/free_delivery.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/home/presentation/widgets/address_dropdown.dart';
import 'package:expo_kg/features/product/data/enums/list_grid_type.dart';
import 'package:expo_kg/features/product/presentation/cubit/list_grid_type.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/size.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/dense_text_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListGridType(),
      child: Builder(
        builder: (context) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeAddressDropDown(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: AppSize.customAppbarHeight,
                  padding: marginH,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return Text(
                            '${state.cartItems.length} товаров',
                          );
                        },
                      ),
                      DenseTextButton(
                        title: 'Отчистить все',
                        isBold: false,
                        function: () {
                          context.read<CartCubit>().clear();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: FreeDeliveryReminder(),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: marginH,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Доставка с 5 ноября',
                            style: st14,
                          ),
                          BlocBuilder<ListGridType, ListGridEnum>(
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<ListGridType>().change();
                                },
                                child: Image.asset(
                                  'assets/icons/product/${state.name}.png',
                                  height: state == ListGridEnum.grid ? 20 : 15,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    sizedbox15,
                  ],
                ),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final products = context
                      .watch<ProductCubit>()
                      .state
                      .products
                      .where(
                        (product) => state.cartItems.any(
                          (element) => product.id == element.productId,
                        ),
                      )
                      .toList();
                  return CartItemsGrid(
                    products: products,
                  );
                },
              ),
              SliverPadding(
                padding: marginV,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: marginHV10,
                        child: Text(
                          'Рекомендуем',
                          style: h18,
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        child: ListView.separated(
                          padding: marginH,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              const CartRecommendedContainer(),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          itemCount: 5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: marginHV10,
                  child: Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Стоимость',
                            style: st14,
                          ),
                          Text(
                            '2 599 KGS',
                            style: h24,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: RoundedButton(
                          title: 'К оформлению',
                          function: () {
                            if (context.read<AuthCubit>().state
                                is AuthInitial) {
                              context.pushNamed(
                                RoutesNames.login,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
