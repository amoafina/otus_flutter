import 'package:otusfood/model/result_operation.dart';

class ErrorOperation extends ResultOperation {
  final String message;

  ErrorOperation({required this.message});
}
