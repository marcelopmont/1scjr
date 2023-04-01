import 'package:scjr1/screens/movies/domain/entities/movie_entity.dart';

class MovieModel {
  const MovieModel({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        title: map['original_title'],
        description: map['overview'],
        image: map['poster_path'],
      );

  MovieEntity toEntity() => MovieEntity(
        title: title,
        description: description,
        image: image,
      );
}
