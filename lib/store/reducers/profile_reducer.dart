import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/Profile/index.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';

final profileReducer = combineReducers<Profile>([
  TypedReducer<Profile, ChangeCurrentExamAction>(_onChangeCurrentExam),
  TypedReducer<Profile, SelectAlternativeAction>(_onChangeAlternative),
]);

Profile _onChangeCurrentExam(Profile state, ChangeCurrentExamAction action) =>
    Profile(
      poscompStatus: PoscompStatus(exam: action.examId),
    );

Profile _onChangeAlternative(Profile state, SelectAlternativeAction action) {
  handleInsertAnswer() {
    if (state.poscompStatus.answers.isEmpty)
      return List.castFrom<dynamic, String>(
          List.from(state.poscompStatus.answers))
        ..insert(action.index, action.alternative);

    return List.castFrom<dynamic, String>(
        List.from(state.poscompStatus.answers))
      ..removeAt(action.index)
      ..insert(action.index, action.alternative);
  }

  return Profile(
    poscompStatus: PoscompStatus(
      exam: state.poscompStatus.exam,
      answers: handleInsertAnswer(),
    ),
  );
}
