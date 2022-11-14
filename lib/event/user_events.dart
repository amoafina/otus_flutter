abstract class UserEvent {}

class Registered extends UserEvent {
  final String login;
  final String password;
  final String repeatPassword;

  Registered({
    required this.login,
    required this.password,
    required this.repeatPassword,
  });
}

class Login extends UserEvent {
  final String login;
  final String password;

  Login({
    required this.login,
    required this.password,
  });
}

class CameOut extends UserEvent {}

class RegistrationIsShown extends UserEvent {
  final int opacity;
  final int paddingTop;

  RegistrationIsShown({
    required this.paddingTop,
    required this.opacity,
  });
}

class LoginIsShown extends UserEvent {
  final int opacity;
  final int paddingTop;

  LoginIsShown({
    required this.paddingTop,
    required this.opacity,
  });
}
