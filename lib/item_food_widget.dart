import 'package:flutter/material.dart';
import 'package:otusfood/model/food.dart';
import 'package:otusfood/utils/utils.dart';

class ItemFoodWidget extends StatelessWidget {
  final Food food;

  const ItemFoodWidget(this.food, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(flex: 2, child: Image.asset(food.getLocalPath())),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 23.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    food.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 16.0,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Text(
                            food.getTimeValue(),
                            style: TextStyle(
                              color: '#2ECC71'.toColor(),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
