import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
import 'package:expo_kg/features/merchant/presentation/cubit/shop_images_controller.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/add_photo.dart';
import 'package:expo_kg/features/merchant/presentation/widgets/textfield_title.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/utils/pop_page.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:expo_kg/shared/widgets/forward_button.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddPosterPage extends StatefulWidget {
  const AddPosterPage({super.key});

  @override
  State<AddPosterPage> createState() => _AddPosterPageState();
}

class _AddPosterPageState extends State<AddPosterPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonAvailableCont(),
        ),
        BlocProvider(
          create: (context) => ShopImagesCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return KeyboardDismisser(
          child: Scaffold(
            body: SafeArea(
              child: FormBuilder(
                key: _formKey,
                onChanged: () {
                  context.read<ButtonAvailableCont>().change(
                        _formKey.currentState!.isValid,
                      );
                },
                child: Column(
                  children: [
                    const AppbarTitle(
                      title: 'Новое объявление',
                    ),
                    Expanded(
                      child: Padding(
                        padding: marginHV10,
                        child: CustomScrollView(
                          slivers: [
                            const SliverToBoxAdapter(
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
                            const SliverToBoxAdapter(
                              child: AddPhoto(),
                            ),
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  TextfieldWithTitle(
                                    title: 'Название товара',
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(
                                          errorText: 'Заполните поле',
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextfieldWithTitle(
                                    title: 'Описание',
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(
                                          errorText: 'Заполните поле',
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextfieldWithTitle(
                                    title: 'Цена',
                                    validator: FormBuilderValidators.compose(
                                      [
                                        FormBuilderValidators.required(
                                          errorText: 'Заполните поле',
                                        ),
                                      ],
                                    ),
                                  ),
                                  sizedbox35,
                                ],
                              ),
                            ),
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                children: [
                                  const Spacer(),
                                  BlocBuilder<ButtonAvailableCont, bool>(
                                    builder: (context, state) {
                                      return RoundedButton(
                                        title: 'Обубликовать',
                                        color: state
                                            ? AppColor.orange
                                            : AppColor.orange.withOpacity(
                                                0.2,
                                              ),
                                        textColor: state
                                            ? AppColor.white
                                            : AppColor.orange,
                                        function: state
                                            ? () {
                                                popPage(context);
                                              }
                                            : null,
                                      );
                                    },
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
          ),
        );
      }),
    );
  }
}
