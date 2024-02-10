import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movies_app/modals/moviesDataList.dart';
import '../modals/Genres.dart';
import '../modals/MoviesListItem.dart';

class MoviesService {
  static Future<List<Genres>> fetchGenres() async {
    var dio = Dio();
    try {
      Response response = await dio.get("https://moviesapi.ir/api/v1/genres");
      List<dynamic> genres = response.data;
      List<Genres> genre = genres.map((e) => Genres.fromJson(e)).toList();
      return genre;
    } catch (e) {
      throw Exception("error @e");
    }
  }

  static Future<List<MoviesDataList>> fetchMoviesDataList(
      {int? genreId}) async {
    var dio = Dio();
    try {
      Response response = await dio.get(
        "https://moviesapi.ir/api/v1/genres/$genreId/movies?page=1",
        data: {
          "genre_id": genreId,
        },
      );
      List<dynamic> movies = response.data;
      List<MoviesDataList> movie =
          movies.map((e) => MoviesDataList.fromJson(e)).toList();
      return movie;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<MovieListItem>> fetchMoviesList() async {
    var dio = Dio();
    try {
      Response response = await dio.get(
        "https://moviesapi.ir/api/v1/movies?page=1",
        data: {
          "page": 1,
        },
      );
      final res = json.decode(response.data);
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }
}
