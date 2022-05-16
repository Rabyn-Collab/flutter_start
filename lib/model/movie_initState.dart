import 'package:flutter_projects_start/api.dart';
import 'package:flutter_projects_start/model/movie.dart';



class  MovieState{

  List<Movie> movies;
  int page;
  String apiPath;
  String searchText;

  MovieState({
    required this.searchText,
    required this.apiPath,
    required this.movies,
    required this.page
});

  MovieState.initState() : page =1, movies = [], apiPath= Api.getPopular, searchText='';


  MovieState copyWith({List<Movie>? movies, String? searchText, String? apiPath, int? page }){
    return MovieState(
        searchText: searchText ?? this.searchText,
        apiPath: apiPath ?? this.apiPath,
        movies: movies ?? this.movies,
        page: page ?? this.page
    );
  }



}

