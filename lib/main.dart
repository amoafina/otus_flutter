import 'package:flutter/material.dart';
import 'package:otusfood/screens/splash_screen.dart';
import 'package:otusfood/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus Food',
      debugShowCheckedModeBanner: false,
      home: SplashScreenWidget(),
      theme: ThemeData(
        primarySwatch: AppColors.themeColor,
      ),
    );
  }
}
