import 'package:expo_kg/features/map/presentation/widgets/address_container.dart';
import 'package:expo_kg/features/map/presentation/widgets/map_container.dart';
import 'package:expo_kg/shared/widgets/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryLocation extends StatelessWidget {
  const DeliveryLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const YandexMapContainer(),
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
    );
  }
}
