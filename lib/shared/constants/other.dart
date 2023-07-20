import 'package:flutter/material.dart';
import 'colors.dart';

final bigShadow = BoxShadow(
  color: AppColor.darkGrey.withOpacity(0.15),
  offset: const Offset(0, 1),
  blurRadius: 15,
);
final smallShadow = BoxShadow(
  color: AppColor.darkGrey.withOpacity(0.15),
  offset: const Offset(0, 1),
  blurRadius: 8,
);
final cartShadow = BoxShadow(
  color: AppColor.darkGrey.withOpacity(0.15),
  offset: const Offset(0, -5),
  blurRadius: 5,
);
final bottombarShadow = BoxShadow(
  blurRadius: 10,
  color: AppColor.darkGrey.withOpacity(0.2),
  spreadRadius: 4,
  offset: const Offset(0, -5),
);
