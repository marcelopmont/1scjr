class CounterCubitState {
  const CounterCubitState({
    required this.counter,
  });

  final int counter;

  CounterCubitState copyWith({
    int? counter,
  }) =>
      CounterCubitState(
        counter: counter ?? this.counter,
      );
}
