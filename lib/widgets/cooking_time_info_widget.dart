import 'package:flutter/material.dart';
import 'package:otusfood/utils/app_colors.dart';

class CookingTimeInfoWidget extends StatelessWidget {
  final String cookingTime;

  CookingTimeInfoWidget({required this.cookingTime});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.watch_later_outlined,
          size: 16.0,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11.0),
          child: Text(
            cookingTime,
            style: TextStyle(
              color: AppColors.mainAccent,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
