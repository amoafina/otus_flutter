abstract class UserEvent {}

class Registration extends UserEvent {
  final String login;
  final String password;
  final String repeatPassword;

  Registration({
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

class Exit extends UserEvent {}

class ShowRegistration extends UserEvent {
  final int opacity;
  final int paddingTop;

  ShowRegistration({
    required this.paddingTop,
    required this.opacity,
  });
}

class ShowLogin extends UserEvent {
  final int opacity;
  final int paddingTop;

  ShowLogin({
    required this.paddingTop,
    required this.opacity,
  });
}
