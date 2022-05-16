import 'package:dio/dio.dart';
import 'package:flutter_projects_start/api.dart';
import 'package:flutter_projects_start/model/movie.dart';
import 'package:flutter_projects_start/model/movie_initState.dart';
import 'package:flutter_projects_start/services/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final movieProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) => MovieProvider());

class MovieProvider extends StateNotifier<MovieState>{
  MovieProvider() : super(MovieState.initState()){
    getData();
  }


  Future<void> getData() async{
    List<Movie> _movie = [];
    if(state.searchText.isEmpty){
      if(state.apiPath == Api.getPopular){
        _movie = await MovieService.getMovieByCategory(page: state.page, apiPath: state.apiPath);
      }else if(state.apiPath == Api.getTopRated){
        _movie = await MovieService.getMovieByCategory(page: state.page, apiPath: state.apiPath);
      }else{
        _movie = await MovieService.getMovieByCategory(page: state.page, apiPath: state.apiPath);
      }
    }else{
      _movie = await MovieService.searchMovie(page: state.page, apiPath: state.apiPath, searchText: state.searchText);

    }

    state = state.copyWith(
        movies:  [...state.movies, ..._movie]
    );
  }


  void searchMovies(String query){
    state = state.copyWith(
        searchText: query,
        movies: [],
        apiPath: Api.searchMovieApi
    );
    getData();
  }

  void changeCategory(String apiPath){
    state = state.copyWith(
        movies: [],
        searchText: '',
        apiPath: apiPath
    );
    getData();
  }

  void loadMore(String apiPath){
    state = state.copyWith(
        movies: [],
        searchText: '',
        page:  state.page + 1
    );
    getData();
  }



}

final videoProvider = FutureProvider.family((ref, int id) => VideoProvider().getMovieId(id));

class VideoProvider{

  Future<String> getMovieId (int id) async{
    final dio = Dio();
    final response = await dio.get('https://api.themoviedb.org/3/movie/$id/videos',
    queryParameters: {
      'api_key': '2a0f926961d00c667e191a21c14461f8',
      'language': 'en-US',
    }
    );

    return response.data['results'][0]['key'];

  }
}