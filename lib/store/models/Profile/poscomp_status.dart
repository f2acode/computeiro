import 'package:meta/meta.dart';

@immutable
class PoscompStatus {
  final int exam;
  final int questionIndex;
  final List<String> answers;

  PoscompStatus({this.exam, this.questionIndex = 0, this.answers = const []});
}
