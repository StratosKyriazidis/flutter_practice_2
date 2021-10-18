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
  } else if (action is CalculateBMI) {
    double bmi = int.parse(store.state.weight) /
        int.parse(store.state.height) /
        int.parse(store.state.height) *
        10000;
    store.dispatch(UpdateBMI(bmi.toString()));
  } else if (action is CalculateBMIStatus) {
    double bmi = double.parse(store.state.bmi);
    if (bmi < 18.4) {
      store.dispatch(UpdateBMIStatus('Underweight'));
    } else if (bmi < 24.9) {
      store.dispatch(UpdateBMIStatus('Normal weight'));
    } else if (bmi < 29.9) {
      store.dispatch(UpdateBMIStatus('Overweight'));
    } else if (bmi < 34.9) {
      store.dispatch(UpdateBMIStatus('Moderately obese'));
    } else if (bmi < 39.9) {
      store.dispatch(UpdateBMIStatus('Severely obese'));
    } else {
      store.dispatch(UpdateBMIStatus('Very severely obese'));
    }
  }

  next(action);
}
