import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class FavoriteButtonWidget extends StatelessWidget {
  Function onTap;
  bool isFavorite;

  FavoriteButtonWidget({
    required this.onTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: UniqueKey(),
      width: 24.0,
      height: 24.0,
      child: InkWell(
        child: _getAnimation(),
        onTap: () => onTap(),
      ),
    );
  }

  _getAnimation() {
    if (isFavorite)
      return new RiveAnimation.asset(
        'assets/riv/heartAnimationRed.riv',
        artboard: 'heartAnimationRed',
        fit: BoxFit.fill,
      );
    return new RiveAnimation.asset(
      'assets/riv/heartAnimationGray.riv',
      artboard: 'heartAnimationGray',
      fit: BoxFit.fill,
    );
  }
}
