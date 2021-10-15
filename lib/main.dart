import 'package:flutter/material.dart';
import 'package:flutter_practice_1/redux/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux/middleware.dart';
import 'redux/reducers.dart';
import 'redux/store.dart';
import 'package:flutter_practice_1/bottom_pane.dart';
import "gender_button.dart";

void main() {
  Store<AppState> _store = Store<AppState>(reducers,
      initialState: AppState.initial(), middleware: [appStateMiddleware]);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: const MaterialApp(
        home: MyHomePage(title: 'BMI CALCULATOR'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      backgroundColor: Colors.deepPurple[900],
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                GenderButton(
                  icon: Icon(
                    Icons.male,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  string: 'MALE',
                  onTap: setGender,
                ),
                GenderButton(
                  icon: Icon(
                    Icons.female,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  string: 'FEMALE',
                  onTap: setGender,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      child: ColoredBox(
                        color: Colors.green,
                        child: Column(
                          children: [
                            const SizedBox(height: 25.0),
                            const Text('HEIGHT'),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  state.height,
                                  style: const TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text('cm'),
                              ],
                            ),
                            Slider(
                              value: double.parse(state.height),
                              min: 20.0,
                              max: 300.0,
                              divisions: 280,
                              onChanged: (double val) {
                                setState(() {
                                  StoreProvider.of<AppState>(context)
                                      .dispatch(UpdateHeight(val.toString()));
                                });
                              },
                            ),
                            const SizedBox(height: 25.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomPane(
                  string: 'WEIGHT',
                  value: state.weight,
                  minus: () => StoreProvider.of<AppState>(context)
                      .dispatch(ReduceWeight()),
                  plus: () => StoreProvider.of<AppState>(context)
                      .dispatch(IncreaseWeight()),
                ),
                BottomPane(
                  string: 'AGE',
                  value: state.age,
                  minus: () =>
                      StoreProvider.of<AppState>(context).dispatch(ReduceAge()),
                  plus: () => StoreProvider.of<AppState>(context)
                      .dispatch(IncreaseAge()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void setGender() {}
