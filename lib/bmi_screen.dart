import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/store.dart';

class BMIScreen extends StatelessWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'YOUR BMI IS',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(state.bmi),
              Text(state.bmiStatus),
            ],
          ),
        ),
      ),
    );
  }
}
