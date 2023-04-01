import 'package:scjr1/screens/movies/domain/entities/movie_entity.dart';

abstract class FetchMovies {
  Future<List<MovieEntity>> execute();
}