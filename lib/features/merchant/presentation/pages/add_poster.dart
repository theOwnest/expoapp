import 'package:expo_kg/features/merchant/presentation/widgets/add_photo.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/forward_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddPosterPage extends StatelessWidget {
  const AddPosterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const KeyboardDismisser(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppbarTitle(
                title: 'Новое объявление',
              ),
              Expanded(
                child: Padding(
                  padding: marginHV10,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            ForwardButton(
                              title: 'Выбрать категорию',
                            ),
                            ForwardButton(
                              title: 'Характеристики',
                            ),
                            ForwardButton(
                              title: 'Варианты доставки',
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: AddPhoto(),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            TextfieldWithTitle(
                              title: 'Название товара',
                            ),
                            TextfieldWithTitle(
                              title: 'Описание',
                            ),
                            TextfieldWithTitle(
                              title: 'Цена',
                            ),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            Spacer(),
                            RoundedButton(
                              title: 'Обубликовать',
                            ),
                          ],
                        ),
                      )
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
