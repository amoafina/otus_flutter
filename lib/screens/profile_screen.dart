import 'package:flutter/material.dart';
import 'package:otusfood/childWidgets/bluetooth_widget.dart';
import 'package:otusfood/presenters/user_presenter.dart';
import 'package:otusfood/utils/app_colors.dart';

import '../model/user.dart';

class ProfileScreen extends StatelessWidget {
  final UserPresenter userPresenter;

  ProfileScreen({required this.userPresenter});

  @override
  Widget build(BuildContext context) {
    User? user = userPresenter.currentUser;
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75.0),
                    child: Align(
                      child: GestureDetector(
                        child: SizedBox(
                          width: 123.0,
                          height: 123.0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4.0,
                                color: AppColors.greenColorBorder,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/images/img_preview_profile.png',
                              ),
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 29.0,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: SizedBox(
                        height: 64.0,
                        child: Padding(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                child: Text(
                                  "Логин",
                                  style: TextStyle(
                                    color: AppColors.greenColorBorder,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                              ),
                              Align(
                                child: Text(
                                  user?.login ?? "-",
                                  style: TextStyle(
                                    color: AppColors.greenBg,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0,
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                      ),
                      child: BluetoothWidget()),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        userPresenter.exit();
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: SizedBox(
                          height: 64.0,
                          child: Center(
                            child: Text(
                              'Выход',
                              style: TextStyle(
                                color: AppColors.active,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
