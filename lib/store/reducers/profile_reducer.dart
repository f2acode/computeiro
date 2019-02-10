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
  print(action.alternative);
  return Profile(
    poscompStatus: PoscompStatus(
      exam: state.poscompStatus.exam,
      answers: state.poscompStatus.answers == null
          ? [action.alternative]
          : List.from(state.poscompStatus.answers)
        ..add(action.alternative),
    ),
  );
}
