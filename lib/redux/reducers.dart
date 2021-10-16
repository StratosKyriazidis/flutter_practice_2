import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  if (action is UpdateWeight) {
    return prevState.copyWith(
      weight: action.payload,
    );
  } else if (action is UpdateAge) {
    return prevState.copyWith(
      age: action.payload,
    );
  } else if (action is UpdateHeight) {
    return prevState.copyWith(
      height: action.payload,
    );
  } else {
    return prevState.copyWith(
      isMale: !prevState.isMale,
    );
  }
}
