import 'package:flutter/material.dart';

class MoviesList extends StatelessWidget {
  MoviesList({super.key, required this.movies, required this.movieName});

  String movies;
  String movieName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/moviePage", arguments: {
              "image": movies,
              "name": movieName,
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                movies,
                fit: BoxFit.cover,
                width: 100,
                height: 200,
              ),
            ),
          ),
        ));
  }
}

class GenresMoviesList extends StatelessWidget {
  GenresMoviesList({super.key, required this.movies, required this.movieName});

  String movies;
  String movieName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 150,
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/moviePage", arguments: {
              "image": movies,
              "name": movieName,
            });
          },
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                movies.toString(),
                fit: BoxFit.cover,
                width: 100,
                height: 200,
              ),
            ),
          ),
        ));
  }
}
