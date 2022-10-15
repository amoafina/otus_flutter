import 'package:otusfood/presenters/messages_presenter.dart';

abstract class BasePresenter {
  final MessagePresenter _messagePresenter;

  BasePresenter({required MessagePresenter messagePresenter})
      : _messagePresenter = messagePresenter;

  addMessage(String message) {
    _messagePresenter.addMessage(message);
  }

  Stream<String> getStreamMessage() => _messagePresenter.getStreamMessage();
}
