import 'package:bredux/bredux.dart';
import 'package:example/app_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BreduxProvider<AppState>(
      initialState: const AppState(),
      child: MaterialApp(
        title: 'Bredux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(
          title: 'Bredux Demo Home Page',
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  void _incrementCounter(BuildContext context) {
    context.stateUpdate<AppState>(
      // state update function, takes old state as an argument and must return new state
      (AppState appState) => appState.copyWith(
        // return new state that is copy of old state..
        counter: appState.counter + 1, // ..with incremented counter
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('You have pushed the button this many times:'),
            CounterValueSimple(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterValueSimple extends StatelessWidget {
  const CounterValueSimple({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bredux<AppState>, AppState>(
      builder: (_, AppState state) {
        return Text(
          '${state.counter}',
          style: Theme.of(context).textTheme.headline4,
        );
      },
    );
  }
}

/*
class CounterValueFromBloc extends StatelessWidget {
  const CounterValueFromBloc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is made for simplicity, you would want to make new bloc controlling CounterValue widget
    // and there will be a subscription to global state and this widget will look like:
    return BlocProvider<CounterBloc>(
      create: (BuildContext context) => CounterBloc(
        stateBloc: context.bredux<AppState>(),
      ),
      child: BlocBuilder<Bredux<AppState>, AppState>(
        builder: (_, AppState state) {
          return Text(
            '${state.counter}',
            style: Theme.of(context).textTheme.headline4,
          );
        },
      ),
    );
  }
}
*/
