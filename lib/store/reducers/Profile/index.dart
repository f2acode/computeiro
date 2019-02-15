import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/Profile/index.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';

final profileReducer = combineReducers<Profile>([
  TypedReducer<Profile, ChangeCurrentExamAction>(_onChangeCurrentExam),
  TypedReducer<Profile, SelectAlternativeAction>(_onChangeAlternative),
  TypedReducer<Profile, NextQuestionAction>(_onNextQuestionAction),
  TypedReducer<Profile, PreviousQuestionAction>(_onPreviousQuestionAction),
]);

Profile _onChangeCurrentExam(Profile state, ChangeCurrentExamAction action) =>
    Profile(
      poscompStatus: PoscompStatus(exam: action.examId),
    );

Profile _onChangeAlternative(Profile state, SelectAlternativeAction action) {
  final List<String> answers = state.poscompStatus.answers;

  List<String> handleInsertAnswer() {
    if (answers.isEmpty)
      return List.castFrom<dynamic, String>(List<String>.from(answers))
        ..insert(action.index, action.alternative);

    return List.castFrom<dynamic, String>(List<String>.from(answers))
      ..removeAt(action.index)
      ..insert(action.index, action.alternative);
  }

  return Profile(
    poscompStatus: PoscompStatus(
      exam: state.poscompStatus.exam,
      questionIndex: state.poscompStatus.questionIndex,
      answers: handleInsertAnswer(),
    ),
  );
}

Profile _onNextQuestionAction(Profile state, NextQuestionAction action) {
  final int newQuestionIndex = state.poscompStatus.questionIndex + 1;
  final List<String> answers = state.poscompStatus.answers;

  List<String> handleAddAnswer() {
    if (newQuestionIndex >= answers.length)
      return List.castFrom<dynamic, String>(List<dynamic>.from(answers))
        ..add('');

    return answers;
  }

  return Profile(
    poscompStatus: PoscompStatus(
      exam: state.poscompStatus.exam,
      questionIndex: newQuestionIndex,
      answers: handleAddAnswer(),
    ),
  );
}

Profile _onPreviousQuestionAction(
    Profile state, PreviousQuestionAction action) {
  return Profile(
    poscompStatus: PoscompStatus(
      exam: state.poscompStatus.exam,
      questionIndex: state.poscompStatus.questionIndex - 1,
      answers: state.poscompStatus.answers,
    ),
  );
}
