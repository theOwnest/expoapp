import 'package:flutter/material.dart';

import '../../../../shared/configs/texts.dart';
import '../../../../shared/constants/colors.dart';

class SearchResultItemContainer extends StatelessWidget {
  final String name;
  const SearchResultItemContainer({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.lightGrey,
            ),
            child: Image.asset(
              'assets/icons/home/location.png',
              color: AppColor.darkGrey,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: st14,
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.lightGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
