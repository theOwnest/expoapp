import 'dart:developer';

import 'package:expo_kg/features/main_scaffold/presentation/cubit/location_cubit.dart';
import 'package:expo_kg/features/map/data/models/address.dart';
import 'package:expo_kg/features/map/data/utils/yandex_search.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/colors.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:expo_kg/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/yandex_map_cubit.dart';
import '../cubit/yandex_search_cubit.dart';
import 'map_search_container.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      padding: marginHV20,
      decoration: const BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Укажите адрес доставки',
            style: h18,
          ),
          const AddressContainerTextfield(),
          BlocBuilder<YandexSearchCubit, YandexSearchState>(
            builder: (context, state) {
              if (state is YandexSearchAssigned) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      context.read<YandexMapCubit>().addPoint(
                            state.locations[index],
                          );

                      context.read<YandexSearchCubit>().empty();
                    },
                    child: SearchResultItemContainer(
                      name: state.locations[index].name,
                    ),
                  ),
                  itemCount:
                      state.locations.length < 5 ? state.locations.length : 5,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          sizedbox20,
          const RoundedButton(
            title: 'Изменить',
          ),
        ],
      ),
    );
  }
}

class AddressContainerTextfield extends StatefulWidget {
  const AddressContainerTextfield({
    super.key,
  });

  @override
  State<AddressContainerTextfield> createState() =>
      _AddressContainerTextfieldState();
}

class _AddressContainerTextfieldState extends State<AddressContainerTextfield> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.lightGrey,
          ),
        ),
        hintText: 'введите адрес',
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 20,
        ),
        suffixIcon: GestureDetector(
          onTap: () async {
            try {
              final locationState = context.read<LocationCubit>().state;
              late AddressModel myLocation;
              if (locationState is LocationAccessed) {
                myLocation = AddressModel(
                  name: 'my-Location',
                  latitude: locationState.currentLocation.latitude,
                  longitude: locationState.currentLocation.longitude,
                );
              } else {
                final point = await context.read<LocationCubit>().getLocation();
                if (point != null && context.mounted) {
                  myLocation = AddressModel(
                    name: 'my-Location',
                    latitude: point.latitude,
                    longitude: point.longitude,
                  );
                }
              }
              if (context.mounted) {
                context.read<YandexMapCubit>().addPoint(myLocation);
              }
            } catch (e) {
              log("Couldn't get to the current location: $e");
            }
          },
          child: Image.asset(
            'assets/icons/home/address.png',
          ),
        ),
      ),
      onChanged: (value) {
        yandexSearch(
          value,
          context,
        );
      },
    );
  }
}
