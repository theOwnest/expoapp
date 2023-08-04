// import 'package:expo_kg/features/auth/presentation/cubit/button_available.dart';
// import 'package:expo_kg/features/merchant/presentation/widgets/textformfield_title.dart';
// import 'package:expo_kg/features/payment/data/models/card.dart';
// import 'package:expo_kg/features/payment/presentation/cubit/card_controller.dart';
// import 'package:expo_kg/shared/constants/colors.dart';
// import 'package:expo_kg/shared/constants/margin.dart';
// import 'package:expo_kg/shared/constants/sizedbox.dart';
// import 'package:expo_kg/shared/widgets/appbar_title.dart';
// import 'package:expo_kg/shared/widgets/rounded_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:go_router/go_router.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';

// class AddCardPage extends StatefulWidget {
//   const AddCardPage({super.key});

//   @override
//   State<AddCardPage> createState() => _AddCardPageState();
// }

// class _AddCardPageState extends State<AddCardPage> {
//   final _formCardKey = GlobalKey<FormBuilderState>();
//   final numberController = TextEditingController();
//   final dateController = TextEditingController();
//   final cvvController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ButtonAvailableCont(),
//       child: Builder(builder: (context) {
//         return KeyboardDismisser(
//           behavior: HitTestBehavior.opaque,
//           child: Column(
//             children: [
//               const AppbarTitle(
//                 title: 'Новая карта',
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: marginH,
//                   child: FormBuilder(
//                     key: _formCardKey,
//                     onChanged: () {
//                       context.read<ButtonAvailableCont>().change(
//                             _formCardKey.currentState!.validate(),
//                           );
//                     },
//                     child: Column(
//                       children: [
//                         TextformfieldWithTitle(
//                           controller: numberController,
//                           title: 'Номер карты',
//                           textInputType: TextInputType.number,
//                           validator: FormBuilderValidators.compose(
//                             [
//                               FormBuilderValidators.equalLength(
//                                 16,
//                                 errorText:
//                                     'Значение должно иметь длину, равную 16',
//                               ),
//                               FormBuilderValidators.required(
//                                 errorText: 'Заполните поле',
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: TextformfieldWithTitle(
//                                 controller: dateController,
//                                 title: 'Срок действия',
//                                 textInputType: TextInputType.number,
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.equalLength(
//                                       4,
//                                       errorText:
//                                           'Значение должно иметь длину, равную 4',
//                                     ),
//                                     FormBuilderValidators.required(
//                                       errorText: 'Заполните поле',
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             Expanded(
//                               child: TextformfieldWithTitle(
//                                 controller: cvvController,
//                                 title: 'CVV / CVC',
//                                 textInputType: TextInputType.number,
//                                 obscureText: true,
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.equalLength(
//                                       3,
//                                       errorText:
//                                           'Значение должно иметь длину, равную 3',
//                                     ),
//                                     FormBuilderValidators.required(
//                                       errorText: 'Заполните поле',
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const Spacer(),
//                         BlocBuilder<ButtonAvailableCont, bool>(
//                           builder: (context, state) {
//                             return RoundedButton(
//                               title: 'Сохранить изменения',
//                               color: state
//                                   ? AppColor.orange
//                                   : AppColor.orange.withOpacity(
//                                       0.2,
//                                     ),
//                               textColor:
//                                   state ? AppColor.white : AppColor.orange,
//                               function: state
//                                   ? () {
//                                       context.read<CardController>().addCard(
//                                             CardModel(
//                                               cardNumber: numberController.text,
//                                               expiration: dateController.text,
//                                               cvv: cvvController.text,
//                                             ),
//                                           );
//                                       if (context.canPop()) context.pop();
//                                     }
//                                   : null,
//                             );
//                           },
//                         ),
//                         sizedbox15,
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
