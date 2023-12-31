import 'package:expo_kg/features/main_scaffold/presentation/cubit/location_cubit.dart';
import 'package:expo_kg/features/map/presentation/cubit/yandex_map_cubit.dart';
import 'package:expo_kg/features/map/presentation/cubit/yandex_search_cubit.dart';
import 'package:expo_kg/features/map/presentation/widgets/address_container.dart';
import 'package:expo_kg/features/map/presentation/widgets/map_container.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class AddressLocation extends StatelessWidget {
  const AddressLocation({super.key});

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
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  return MapContainer(
                    position: state is LocationAccessed
                        ? state.currentLocation
                        : null,
                  );
                },
              ),
              Positioned(
                top: 45.h,
                left: 15,
                child: const AppbarBackButton(),
              ),
              const Positioned(
                bottom: 0,
                child: AddressContainer(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
