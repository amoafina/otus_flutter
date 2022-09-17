import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otusfood/utils/utils.dart';

class CookingTimeInfoWidget extends StatelessWidget {
  String cookingTime;

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
              color: '#2ECC71'.toColor(),
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
