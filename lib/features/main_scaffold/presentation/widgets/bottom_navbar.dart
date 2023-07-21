import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/other.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:expo_kg/features/main_scaffold/data/datasources/bottombar_items.dart';
import 'package:expo_kg/features/main_scaffold/presentation/cubit/bottom_navbar_cont.dart';
import 'package:expo_kg/shared/constants/colors.dart';

class MainBottomNavbar extends StatelessWidget {
  const MainBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavbarCont, int>(
      builder: (context, state) => Container(
        height: 80,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(
              20,
            ),
          ),
          boxShadow: [
            bigShadow,
          ],
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Row(
          children: List.generate(
            bottomBarLabels.length,
            (index) => Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<BottomNavbarCont>().change(index);
                },
                child: BottomNavbarItem(
                  title: bottomBarLabels[index],
                  icon: bottomBarIcons[index],
                  isSelected: context.read<BottomNavbarCont>().state == index,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);
  final String title;
  final String icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Image.asset(
            'assets/icons/navbar/$icon.png',
            color: isSelected ? AppColor.orange : AppColor.darkGrey,
            height: 20,
            width: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: st11.copyWith(
              color: isSelected ? AppColor.orange : AppColor.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem bottomNavbarItem(
    String title, String icon, bool isSelected) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      'assets/icons/navbar/$icon.png',
      color: isSelected ? AppColor.orange : AppColor.darkGrey,
      height: 20,
    ),
    label: title,
  );
}
