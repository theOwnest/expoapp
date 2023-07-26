import 'package:expo_kg/features/search/presentation/pages/filter.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

showFilterBottomSheet(
  BuildContext context,
) {
  showMaterialModalBottomSheet(
    context: context,
    useRootNavigator: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    )),
    builder: (context) => const FilterBottomSheet(),
  );
}
