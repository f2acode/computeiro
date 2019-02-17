import 'package:redux_epics/redux_epics.dart';

import 'package:computeiro/store/actions/index.dart';
import 'package:computeiro/store/models/app_state.dart';
import 'package:computeiro/store/middlewares/DumbSearch/requests.dart';

Stream<dynamic> searchEpic(
  Stream<PerformSearchAction> actions,
  EpicStore<AppState> store,
) {
  return actions.asyncMap<dynamic>((PerformSearchAction action) => fetchPost()
      .then<dynamic>(
        (Map<String, dynamic> results) => SearchResultsAction(results['title']),
      )
      .catchError((dynamic error) => SearchErrorAction(error.toString())));
}
