import 'package:flutter/material.dart';
import 'package:flutter_practice_1/bmi_screen.dart';
import 'redux/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/middleware.dart';
import 'redux/reducers.dart';
import 'redux/store.dart';
import 'bottom_pane.dart';
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
      child: MaterialApp(
        home: const MyHomePage(title: 'BMI CALCULATOR'),
        routes: {'/calculate': (context) => const BMIScreen()},
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
  var _maleColor = Colors.lime;
  var _femaleColor = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderButton(
                  color: _maleColor,
                  icon: const Icon(
                    Icons.male,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  string: 'MALE',
                  onTap: () {
                    setState(() {
                      if (!state.isMale) {
                        var temp = _maleColor;
                        _maleColor = _femaleColor;
                        _femaleColor = temp;
                        StoreProvider.of<AppState>(context)
                            .dispatch(ChangeGender());
                      }
                    });
                  },
                ),
                GenderButton(
                  color: _femaleColor,
                  icon: const Icon(
                    Icons.female,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  string: 'FEMALE',
                  onTap: () {
                    setState(() {
                      if (state.isMale) {
                        var temp = _maleColor;
                        _maleColor = _femaleColor;
                        _femaleColor = temp;
                        StoreProvider.of<AppState>(context)
                            .dispatch(ChangeGender());
                      }
                    });
                  },
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
                                  int temp = val.toInt();
                                  StoreProvider.of<AppState>(context)
                                      .dispatch(UpdateHeight(temp.toString()));
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
      bottomNavigationBar: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) => TextButton(
          onPressed: () {
            setState(() {
              StoreProvider.of<AppState>(context).dispatch(CalculateBMI());
              StoreProvider.of<AppState>(context)
                  .dispatch(CalculateBMIStatus());
              Navigator.of(context).pushNamed('/calculate');
            });
          },
          child: ColoredBox(
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                SizedBox(height: 10.0),
                Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15.0),
                Divider(
                  thickness: 5.0,
                  indent: 100.0,
                  endIndent: 100.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
