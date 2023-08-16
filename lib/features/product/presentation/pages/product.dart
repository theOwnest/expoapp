import 'package:expo_kg/features/favorite/presentation/cubit/favorite_cubit.dart';
import 'package:expo_kg/features/home/presentation/cubit/product_cubit.dart';
import 'package:expo_kg/features/product/presentation/cubit/product_cont.dart';
import 'package:expo_kg/features/product/presentation/widgets/appbar_button.dart';
import 'package:expo_kg/features/product/presentation/widgets/ask_questions.dart';
import 'package:expo_kg/features/product/presentation/widgets/other_products.dart';
import 'package:expo_kg/features/product/presentation/widgets/product_comments.dart';
import 'package:expo_kg/features/product/presentation/widgets/product_image.dart';
import 'package:expo_kg/features/product/presentation/widgets/product_specs.dart';
import 'package:expo_kg/features/product/presentation/widgets/shop_container.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/utils/pop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.productId,
  }) : super(key: key);
  final String productId;
  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductCubit>().getById(
          productId,
        );
    return BlocProvider(
      create: (context) => ProductController(
        product,
      ),
      child: KeyboardDismisser(
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
                          popPage(context);
                        },
                      ),
                      Row(
                        children: [
                          const AppbarButtonContainer(
                            icon: 'upload',
                          ),
                          sizedboxH15,
                          BlocBuilder<FavoriteCubit, FavoriteState>(
                            builder: (context, state) {
                              return AppbarButtonContainer(
                                icon: context
                                        .read<FavoriteCubit>()
                                        .isFavorite(productId)
                                    ? 'heart-filled'
                                    : 'heart',
                                function: () {
                                  context.read<FavoriteCubit>().favoriteAction(
                                        productId,
                                      );
                                },
                              );
                            },
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
                        const ProductImageSlider(),
                        Padding(
                          padding: marginH,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: h18,
                              ),
                              const ProductShopContainer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Описание',
                                    style: h14,
                                  ),
                                  sizedbox15,
                                  Text(
                                    product.description,
                                    style: st14,
                                  ),
                                ],
                              ),
                              sizedbox30,
                              const ProductSpecs(),
                              sizedbox30,
                              const ProductComments(),
                              BlocBuilder<ProductCubit, ProductState>(
                                builder: (context, state) {
                                  return ProductOtherProducts(
                                    title: 'Похожие товары',
                                    products: state.products,
                                  );
                                },
                              ),
                              BlocBuilder<ProductCubit, ProductState>(
                                builder: (context, state) {
                                  return ProductOtherProducts(
                                    title: 'Товары этого продавца',
                                    products: state.products,
                                  );
                                },
                              ),
                              const ProductAskQuestions(),
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
      ),
    );
  }
}
