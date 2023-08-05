import 'package:flutter/material.dart';

import 'border_radius.dart';
import 'colors.dart';

final commonThinBorder = Border.all(
  color: AppColor.lightGrey,
  width: 1,
);

const underlineInputBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: AppColor.lightGrey,
  ),
);
final outlineInputBorder = OutlineInputBorder(
  borderRadius: borderR10,
  borderSide: const BorderSide(
    color: AppColor.lightGrey,
    width: 1,
  ),
);
