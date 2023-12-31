import 'package:expo_kg/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/utils/pop_page.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final emailCont = TextEditingController();
  final passCont = TextEditingController();
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          FormBuilderTextField(
            key: _emailFieldKey,
            controller: emailCont,
            name: 'Почта/номер',
            textInputAction: TextInputAction.next,
            style: st14.copyWith(
              color: AppColor.black,
            ),
            decoration: InputDecoration(
              labelText: 'Почта/номер',
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 20,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/login/person.png',
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
          FormBuilderTextField(
            textInputAction: TextInputAction.done,
            name: 'Пароль',
            style: st14.copyWith(
              color: AppColor.black,
            ),
            controller: passCont,
            decoration: InputDecoration(
              labelText: 'Пароль',
              prefixIconConstraints: const BoxConstraints(
                maxHeight: 20,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/login/lock.png',
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
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              const Text(
                'Забыли свой пароль?',
                style: st14,
              ),
              sizedbox15,
              RoundedButton(
                title: 'Войти',
                function: () {
                  // Validate and save the form values
                  if (_formKey.currentState!.saveAndValidate()) {
                    debugPrint(_formKey.currentState?.value.toString());
                    context.read<AuthCubit>().login(
                          emailCont.text,
                          passCont.text,
                        );
                    popPage(context);
                  }
                  // On another side, can access all field values without saving form with instantValues
                  // _formKey.currentState?.validate();
                  // debugPrint(_formKey.currentState?.instantValue.toString());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
