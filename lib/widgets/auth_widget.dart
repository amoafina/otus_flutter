import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otusfood/utils/app_colors.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Otus.Food',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      child: SizedBox(
                        width: 232.0,
                        child: TextFormField(
                          controller: _loginController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColors.grayApp,
                            ),
                            hintText: 'Логин',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        top: 81.0,
                      ),
                    ),
                    Padding(
                      child: SizedBox(
                        width: 232.0,
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 12,
                              bottom: 12,
                            ),
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppColors.grayApp,
                            ),
                            hintText: 'Пароль',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        top: 16.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SizedBox(
                        width: 232.0,
                        child: MaterialButton(
                          child: Text(
                            'Войти',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: AppColors.colorLogIn,
                          onPressed: _logIn,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
          mainAxisSize: MainAxisSize.max,
        ),
        color: AppColors.greenBg,
      ),
    );
  }

  void _logIn() {
    print('login');
    var login = _loginController.text;
    var password = _passwordController.text;
    if (login.isEmpty && password.isEmpty) {
    } else if (login.isEmpty) {
    } else if (password.isEmpty) {
    } else {}
  }
}
