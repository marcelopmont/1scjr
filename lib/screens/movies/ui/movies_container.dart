import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scjr1/screens/movies/bloc/movies_cubit.dart';
import 'package:scjr1/screens/movies/bloc/movies_cubit_state.dart';
import 'package:scjr1/screens/movies/ui/movies_screen.dart';

class MoviesContainer extends BlocBuilder<MoviesCubit, MoviesCubitState> {
  MoviesContainer({super.key}) : super(
    builder: (context, state) {
      return MoviesScreen(
        moviesList: state.moviesList,
      );
    }
  );
}