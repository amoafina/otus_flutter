import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otusfood/presenters/user_presenter.dart';
import 'package:otusfood/state/user_state.dart';

import '../event/user_events.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required this.userPresenter,
  }) : super(Init()) {
    on<Login>(
      (event, emit) => userPresenter.login(
        event.login,
        event.password,
      ),
    );
    on<Registration>(
      (event, emit) => userPresenter.registration(
        event.login,
        event.password,
        event.repeatPassword,
      ),
    );
    on<ShowLogin>((event, emit) => emit(LoginPage(
          opacity: event.opacity,
          paddingTop: event.paddingTop,
        )));
    on<ShowRegistration>((event, emit) => emit(RegistrationPage(
          opacity: event.opacity,
          paddingTop: event.paddingTop,
        )));
  }

  final UserPresenter userPresenter;
}
