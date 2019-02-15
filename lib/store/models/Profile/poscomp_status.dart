import 'package:meta/meta.dart';

@immutable
class PoscompStatus {
  const PoscompStatus({
    this.exam,
    this.questionIndex = 0,
    this.answers = const <String>[],
  });

  final int exam;
  final int questionIndex;
  final List<String> answers;
}
