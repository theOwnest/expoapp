import 'package:expo_kg/features/map/data/datasources/demo_location.dart';
import 'package:expo_kg/features/map/presentation/widgets/delivery_container.dart';
import 'package:expo_kg/features/map/presentation/widgets/map_container.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../cubit/yandex_map_cubit.dart';
import '../cubit/yandex_search_cubit.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => YandexMapCubit(),
        ),
        BlocProvider(
          create: (context) => YandexSearchCubit(),
        ),
      ],
      child: KeyboardDismisser(
        child: Scaffold(
          body: Stack(
            children: [
              MapContainer(
                position: demoLocation,
              ),
              Positioned(
                top: 45.h,
                left: 15,
                child: const AppbarBackButton(),
              ),
              const Positioned(
                bottom: 0,
                child: DeliveryContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
