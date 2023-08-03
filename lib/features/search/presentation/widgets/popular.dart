import 'package:expo_kg/features/category/data/datasources/subcategories.dart';
import 'package:expo_kg/shared/configs/texts.dart';
import 'package:expo_kg/shared/constants/margin.dart';
import 'package:expo_kg/shared/constants/sizedbox.dart';
import 'package:flutter/material.dart';

class SearchPopularContainer extends StatelessWidget {
  const SearchPopularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: marginHV15,
          child: Text(
            'Популярное',
            style: h14,
          ),
        ),
        Padding(
          padding: marginH,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Text(
              subcategoryList[index],
              style: st14,
            ),
            separatorBuilder: (context, index) => sizedbox15,
            itemCount: subcategoryList.length > 5 ? 5 : subcategoryList.length,
          ),
        )
      ],
    );
  }
}
