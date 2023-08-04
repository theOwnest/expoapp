import 'package:expo_kg/features/payment/data/datasources/payment_types.dart';
import 'package:expo_kg/features/payment/presentation/cubit/card_controller.dart';
import 'package:expo_kg/features/payment/presentation/cubit/selected_card.dart';
import 'package:expo_kg/features/payment/presentation/widgets/card_container.dart';
import 'package:expo_kg/features/payment/presentation/widgets/payment_container.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardController()..load(),
        ),
        BlocProvider(
          create: (context) => SelectedCard(),
        ),
      ],
      child: Builder(builder: (context) {
        return Column(
          children: [
            const AppbarTitle(
              title: 'Cпособ оплаты',
            ),
            Expanded(
              child: Padding(
                padding: marginHV10,
                child: BlocBuilder<CardController, List<CreditCardModel>>(
                  builder: (context, state) {
                    return CustomScrollView(
                      slivers: [
                        SliverList.separated(
                          itemBuilder: (context, index) => CardContainer(
                            card: state[index],
                            index: index,
                          ),
                          separatorBuilder: (context, index) => sizedbox15,
                          itemCount: state.length,
                        ),
                        const SliverToBoxAdapter(
                          child: sizedbox15,
                        ),
                        SliverList.separated(
                          itemBuilder: (context, index) => PaymentTypeContainer(
                            title: paymentTypeList[index],
                            index: state.length + index,
                          ),
                          separatorBuilder: (context, index) => sizedbox15,
                          itemCount: paymentTypeList.length,
                        ),
                        const SliverToBoxAdapter(
                          child: sizedbox15,
                        ),
                        SliverToBoxAdapter(
                          child: Builder(
                            builder: (context) {
                              if (state.isEmpty) {
                                return RoundedButton(
                                  title: 'Привязать карту',
                                  function: () {
                                    context.pushNamed(
                                      RoutesNames.addCard,
                                      extra: BlocProvider.of<CardController>(
                                          context),
                                    );
                                  },
                                );
                              }
                              return RoundedButton(
                                title: '+ Добавить карту',
                                color: AppColor.black,
                                function: () {
                                  context.pushNamed(
                                    RoutesNames.addCard,
                                    extra: BlocProvider.of<CardController>(
                                        context),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
