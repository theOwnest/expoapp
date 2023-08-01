import 'package:expo_kg/features/main_scaffold/presentation/cubit/location_cubit.dart';
import 'package:expo_kg/shared/configs/routes.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeAddressDropDown extends StatelessWidget {
  const HomeAddressDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          RoutesNames.deliveryLocation,
          extra: BlocProvider.of<LocationCubit>(context),
        );
      },
      child: Padding(
        padding: marginHV10,
        child: Row(
          children: [
            Image.asset(
              'assets/icons/home/location.png',
              height: 17,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'улица Центральная, д. 15',
              style: st14,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }
}
