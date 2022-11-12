abstract class UserState {}

class Init extends UserState {}

class LoginPage extends UserState {
  final int opacity;
  final int paddingTop;

  LoginPage({
    required this.opacity,
    required this.paddingTop,
  });
}

class RegistrationPage extends UserState {
  final int opacity;
  final int paddingTop;

  RegistrationPage({
    required this.opacity,
    required this.paddingTop,
  });
}
