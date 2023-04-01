import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/counter_cubit.dart';
import '../../bloc/counter_cubit_state.dart';
import '../screens/counter_screen.dart';

class CounterContainer extends BlocBuilder<CounterCubit, CounterCubitState> {
  CounterContainer({super.key})
      : super(builder: (context, state) {
    return CounterScreen(
      counter: state.counter,
      onIncrementPressed: () {
        CounterCubitProvider.of(context).increment();
      },
    );
  });
}
