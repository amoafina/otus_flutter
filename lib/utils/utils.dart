import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

getRoute(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

String dateFormatForRead(dateTimeString) {
  return DateFormat('dd.MM.yyyy').format(DateTime.parse(dateTimeString)).trim();
}

String dateTimeFormatForRead(dateTimeString) {
  return DateFormat('dd.MM.yyyy H:m').format(DateTime.parse(dateTimeString)).trim();
}
