import 'dart:convert';

import 'package:http/http.dart';
import 'package:scjr1/screens/movies/domain/entities/movie_entity.dart';
import 'package:scjr1/screens/movies/domain/use_cases/fetch_movies.dart';

import '../models/movie_model.dart';

class RemoteFetchMovies extends FetchMovies {
  @override
  Future<List<MovieEntity>> execute() async {
    try {
      final uri = Uri.parse('https://demo7206081.mockable.io/movies');
      final response = await Client().get(uri);
      final responseJson = jsonDecode(response.body);

      return responseJson['results']
          .map<MovieEntity>((map) => MovieModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      return [];
    }
  }

}