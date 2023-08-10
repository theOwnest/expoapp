// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../cubit/button_available.dart';

class AnketaForm extends StatefulWidget {
  const AnketaForm({
    Key? key,
    required this.nameCont,
    required this.emailCont,
    required this.passCont,
  }) : super(key: key);
  final TextEditingController nameCont;
  final TextEditingController emailCont;
  final TextEditingController passCont;
  @override
  State<AnketaForm> createState() => _AnketaFormState();
}

class _AnketaFormState extends State<AnketaForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        context.read<ButtonAvailableCont>().change(
              _formKey.currentState!.isValid,
            );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ФИО',
            style: h14,
          ),
          FormBuilderTextField(
            name: 'Почта/номер',
            textInputAction: TextInputAction.next,
            style: st14.copyWith(
              color: AppColor.black,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.nameCont,
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 20,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/login/person.png',
                    color: AppColor.lightGrey,
                  ),
                  sizedboxH15,
                ],
              ),
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Заполните поле',
                ),
              ],
            ),
          ),
          sizedbox10,
          const Text(
            'Почта',
            style: h14,
          ),
          FormBuilderTextField(
            name: 'Почта/номер',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.emailCont,
            textInputAction: TextInputAction.next,
            style: st14.copyWith(
              color: AppColor.black,
            ),
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 20,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/login/email.png',
                    color: AppColor.lightGrey,
                  ),
                  sizedboxH15,
                ],
              ),
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Заполните поле',
                ),
                FormBuilderValidators.email(
                  errorText: 'Неверно введена почта/номер',
                ),
              ],
            ),
          ),
          sizedbox10,
          const Text(
            'Придумайте пароль',
            style: h14,
          ),
          FormBuilderTextField(
            textInputAction: TextInputAction.done,
            name: 'Пароль',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.passCont,
            style: st14.copyWith(
              color: AppColor.black,
            ),
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 20,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/login/lock.png',
                    color: AppColor.lightGrey,
                  ),
                  sizedboxH15,
                ],
              ),
              suffixIconConstraints: const BoxConstraints(
                maxWidth: 20,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscured = !isObscured;
                  });
                },
                child: isObscured
                    ? Image.asset(
                        'assets/icons/login/eye-open.png',
                      )
                    : Image.asset(
                        'assets/icons/login/eye-closed.png',
                      ),
              ),
            ),
            obscureText: isObscured,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  errorText: 'Заполните поле',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
