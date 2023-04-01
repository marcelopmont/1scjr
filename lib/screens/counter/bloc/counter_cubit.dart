import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterCubitState> {
  CounterCubit(super.initialState);

  void increment() {
    var counter = state.counter;
    counter++;
    emit(state.copyWith(counter: counter));
  }
}

class CounterCubitProvider extends BlocProvider<CounterCubit> {
  CounterCubitProvider({Key? key, Widget? child})
      : super(
    key: key,
    create: (context) => CounterCubit(
      const CounterCubitState(counter: 0),
    ),
    child: child,
  );

  static CounterCubit of(BuildContext context) => BlocProvider.of(context);
}
