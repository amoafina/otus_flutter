import 'dart:async';

class MessagePresenter {
  StreamController<String> _messageController = new StreamController.broadcast();

  Stream<String> getStreamMessage() => _messageController.stream;

  void addMessage(String message) {
    _messageController.add(message);
  }
}
