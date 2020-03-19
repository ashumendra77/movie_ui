import 'package:flutter/material.dart';

class Movie {
  String name, imageUrl, info, description, publisher;
  int rating;
  Movie({
    @required this.name,
    @required this.imageUrl,
    @required this.info,
    @required this.description,
    @required this.publisher,
    @required this.rating,
  });
}

List<Movie> movieList = [
  Movie(
    name: "DeadPool",
    imageUrl: "assets/images/deadpool.jpeg",
    info: "2016 | Sci-fi | Action 1h 49Min",
    description:
        "Ajax, a twisted scientist, experiment on wade willson a mercury ,to cure him of cancer and give him heading powers. However, the experiments leaves Wades distiguard and he decide sto revenges.",
    publisher: "iMDB",
    rating: 8,
  ),
  Movie(
    name: "Avengers End-Game",
    imageUrl: "assets/images/avenger.jpeg",
    info: "2001 | Sci-fi | Action 10h 49Min",
    description:
        "Ajax, a twisted scientist, experiment on wade willson a mercury ,to cure him of cancer and give him heading powers. However, the experiments leaves Wades distiguard and he decide sto revenges.",
    publisher: "iMDB",
    rating: 2
  ),
  Movie(
    name: "Black Panther",
    imageUrl: "assets/images/black_panther.jpeg",
    info: "2008 | Sci-fi | Action 1h 49Min",
    description:
        "Ajax, a twisted scientist, experiment on wade willson a mercury ,to cure him of cancer and give him heading powers. However, the experiments leaves Wades distiguard and he decide sto revenges.",
    publisher: "iMDB",
    rating: 7,
  ),
];
