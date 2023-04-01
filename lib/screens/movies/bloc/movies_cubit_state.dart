import '../domain/entities/movie_entity.dart';

class MoviesCubitState {
  MoviesCubitState({required this.moviesList});

  final List<MovieEntity> moviesList;

  MoviesCubitState copyWith({
    List<MovieEntity>? moviesList,
  }) =>
      MoviesCubitState(
        moviesList: (moviesList != null) ? moviesList : this.moviesList,
      );
}
