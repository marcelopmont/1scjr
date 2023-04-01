import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scjr1/screens/movies/bloc/movies_cubit_state.dart';
import 'package:scjr1/screens/movies/data/use_cases/remote_fetch_movies.dart';
import 'package:scjr1/screens/movies/domain/use_cases/fetch_movies.dart';

class MoviesCubit extends Cubit<MoviesCubitState> {
  MoviesCubit(
    super.initialState, {
    required this.fetchMovies,
  });

  FetchMovies fetchMovies;

  Future<void> fetch() async {
    final moviesList = await fetchMovies.execute();
    emit(state.copyWith(moviesList: moviesList));
  }
}

class MoviesCubitProvider extends BlocProvider<MoviesCubit> {
  MoviesCubitProvider({super.key, Widget? child})
      : super(
          create: (context) => MoviesCubit(
            MoviesCubitState(moviesList: []),
            fetchMovies: RemoteFetchMovies(),
          )..fetch(),
          child: child,
        );

  static MoviesCubit of(BuildContext context) => BlocProvider.of(context);
}
