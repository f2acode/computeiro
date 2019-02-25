class PoscompStatus {
  PoscompStatus({
    this.exam = 0,
    this.questionIndex = 0,
    this.answers = const <String>[],
  });

  void setExam(int newExam) {
    exam = newExam;
  }

  void insertAnswer({String alternative, int questionIndex}) {
    if (answers.isEmpty)
      answers = List<String>.from(answers)..add(alternative);
    else
      answers = List<String>.from(answers)
        ..removeAt(questionIndex)
        ..insert(questionIndex, alternative);
  }

  void nextQuestion() {
    answers = List<String>.from(answers)..add('');

    questionIndex = questionIndex + 1;
  }

  void previousQuestion() {
    questionIndex = questionIndex - 1;
  }

  int exam;
  int questionIndex;
  List<String> answers;
}
