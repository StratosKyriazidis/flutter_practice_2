import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/store.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'YOUR BMI IS',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          Text(state.bmi),
          Text(state.bmiStatus),
        ],
      ),
    );
  }
}
