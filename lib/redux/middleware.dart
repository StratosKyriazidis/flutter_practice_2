import 'package:redux/redux.dart';
import 'actions.dart';
import 'store.dart';

void appStateMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  int temp = 0;
  if (action is IncreaseWeight) {
    temp = int.parse(store.state.weight) + 1;
    store.dispatch(UpdateWeight(temp.toString()));
  } else if (action is ReduceWeight) {
    temp = int.parse(store.state.weight) - 1;
    store.dispatch(UpdateWeight(temp.toString()));
  } else if (action is IncreaseAge) {
    temp = int.parse(store.state.age) + 1;
    store.dispatch(UpdateAge(temp.toString()));
  } else if (action is ReduceAge) {
    temp = int.parse(store.state.age) - 1;
    store.dispatch(UpdateAge(temp.toString()));
  }

  next(action);
}
