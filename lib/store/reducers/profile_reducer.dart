import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/Profile/index.dart';
import 'package:computeiro/store/models/Profile/poscomp_status.dart';

final profileReducer = combineReducers<Profile>([
  TypedReducer<Profile, ChangeCurrentExamAction>(_onChangeCurrentExam),
]);

Profile _onChangeCurrentExam(Profile state, ChangeCurrentExamAction action) =>
    Profile(poscompStatus: PoscompStatus(exam: action.examId));
