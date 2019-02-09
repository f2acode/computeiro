import 'package:redux/redux.dart';
import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/index.dart';

final poscompReducer = combineReducers<Poscomp>([
  TypedReducer<Poscomp, UpdatePoscompBalanceAction>(_updatePoscompBalance),
]);

Poscomp _updatePoscompBalance(
    Poscomp poscomp, UpdatePoscompBalanceAction action) {
  return Poscomp(balance: action.newPoscompBalance);
}
