import 'dart:async';

import 'package:otusfood/base/base_presenter.dart';
import 'package:otusfood/model/error_operation.dart';
import 'package:otusfood/model/result_operation.dart';
import 'package:otusfood/model/success_operation.dart';
import 'package:otusfood/model/user.dart';
import 'package:otusfood/presenters/messages_presenter.dart';
import 'package:otusfood/repositories/user_repository.dart';

class UserPresenter extends BasePresenter {
  final UserRepository _userRepository;

  StreamController<User?> _userStreamController = new StreamController();

  UserPresenter(
    this._userRepository, {
    required MessagePresenter messagePresenter,
  }) : super(messagePresenter: messagePresenter);

  Stream<User?> getUserStream() => _userStreamController.stream;

  registration(String login, String password, String repeatPassword) {
    if (login.isNotEmpty && password.isNotEmpty && repeatPassword.isNotEmpty) {
      if (password == repeatPassword) {
        _userRepository
            .registrationUser(login, password)
            .then((resultOperation) => _parseResultOperation(resultOperation));
      } else {
        addMessage('Пароли должны совпадать');
      }
    } else {
      addMessage('Логин и пароль не должны быть пустыми');
    }
  }

  _parseResultOperation(ResultOperation resultOperation) {
    if (resultOperation is ErrorOperation) {
      String msg = resultOperation.message;
      addMessage(msg);
    } else if (resultOperation is SuccessOperation) {
      User? user = resultOperation.object as User?;
      if (user != null) {
        _userStreamController.add(user);
      }
    }
  }

  login(String login, String password) {
    if (login.isEmpty && password.isEmpty) {
      addMessage('Логин и пароль не должны быть пустыми');
    } else if (login.isEmpty) {
      addMessage('Логин не должен быть пустым');
    } else if (password.isEmpty) {
      addMessage('Пароль не должен быть пустым');
    } else {
      _userRepository
          .logIn(login, password)
          .then((resultOperation) => _parseResultOperation(resultOperation));
    }
  }

  exit() => _userStreamController.add(null);
}
