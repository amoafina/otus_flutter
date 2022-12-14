import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/bloc/user_bloc.dart';
import 'package:otusfood/presenters/user_presenter.dart';
import 'package:otusfood/state/user_state.dart';
import 'package:otusfood/utils/app_colors.dart';

import '../event/user_events.dart';

class AuthScreen extends StatefulWidget {
  final UserPresenter userPresenter;

  AuthScreen({required this.userPresenter});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late TextEditingController _loginController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordRepeatController;

  Duration _defaultDuration = Duration(
    milliseconds: 500,
  );

  @override
  void initState() {
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordRepeatController = TextEditingController();
    context.read<UserBloc>().add(
          LoginIsShown(
            opacity: 0,
            paddingTop: 40,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (builder, state) {
        if (state is LoginPage) {
          return _createBodyWidget(state.opacity, state.paddingTop, state);
        } else if (state is RegistrationPage) {
          return _createBodyWidget(state.opacity, state.paddingTop, state);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _createBodyWidget(
    int opacity,
    int paddingTop,
    UserState userState,
  ) {
    return SingleChildScrollView(child: ConstrainedBox(
      child: SafeArea(
        child: Container(
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
                              prefixIcon: ImageIcon(
                                AssetImage("assets/images/ic_profile.png"),
                                size: 24.0,
                                color: Colors.grey,
                              ),
                              hintText: '??????????',
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
                              prefixIcon: ImageIcon(
                                AssetImage("assets/images/ic_password.png"),
                                size: 24.0,
                                color: Colors.grey,
                              ),
                              hintText: '????????????',
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
                      Stack(
                        children: [
                          AnimatedOpacity(
                            opacity: opacity.toDouble(),
                            duration: _defaultDuration,
                            child: Padding(
                              child: SizedBox(
                                width: 232.0,
                                child: TextFormField(
                                  controller: _passwordRepeatController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                      top: 12,
                                      bottom: 12,
                                    ),
                                    prefixIcon: ImageIcon(
                                      AssetImage(
                                          "assets/images/ic_password.png"),
                                      size: 24.0,
                                      color: Colors.grey,
                                    ),
                                    hintText: '???????????? ?????? ??????',
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
                          ),
                          AnimatedPadding(
                            padding: EdgeInsets.only(
                              top: paddingTop.toDouble(),
                            ),
                            duration: _defaultDuration,
                            child: AnimatedCrossFade(
                              firstChild: _logInButtonWidget(),
                              secondChild: _createRegistrationButton(),
                              crossFadeState: paddingTop == 40
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: _defaultDuration,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 26.0,
                  ),
                  child: TextButton(
                    child: AnimatedCrossFade(
                      duration: _defaultDuration,
                      crossFadeState: opacity == 0
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: _createTextButton('????????????????????????????????????'),
                      secondChild: _createTextButton('?????????? ?? ????????????????????'),
                    ),
                    onPressed: () {
                      opacity = opacity == 1 ? 0 : 1;
                      paddingTop = paddingTop == 40 ? 104 : 40;
                      if (userState is LoginPage) {
                        context.read<UserBloc>().add(RegistrationIsShown(
                            paddingTop: paddingTop, opacity: opacity));
                      } else if (userState is RegistrationPage) {
                        context.read<UserBloc>().add(LoginIsShown(
                            paddingTop: paddingTop, opacity: opacity));
                      }
                    },
                  ),
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.max,
          ),
          color: AppColors.greenBg,
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - 58.0,
      ),
    ),);
  }

  Widget _createTextButton(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    );
  }

  Widget _logInButtonWidget() {
    return SizedBox(
      width: 232.0,
      height: 48.0,
      child: MaterialButton(
        child: Text(
          '??????????',
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
    );
  }

  Widget _createRegistrationButton() {
    return SizedBox(
      width: 232.0,
      height: 48.0,
      child: MaterialButton(
        child: Text(
          '??????????????????????',
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
        onPressed: _registration,
      ),
    );
  }

  void _logIn() {
    var login = _loginController.text;
    var password = _passwordController.text;
    context.read<UserBloc>().add(Login(login: login, password: password));
  }

  void _registration() {
    String login = _loginController.text;
    String password = _passwordController.text;
    String passwordRepeat = _passwordRepeatController.text;
    context.read<UserBloc>().add(Registered(
        login: login, password: password, repeatPassword: passwordRepeat));
  }
}
