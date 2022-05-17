import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_projects_start/api.dart';
import 'package:flutter_projects_start/model/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';




class MovieService{

  static Future<List<Movie>> getMovieByCategory({required int page,required String apiPath}) async{
    final dio = Dio();
    final prefs = await SharedPreferences.getInstance();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'language': 'en-US',
        'page': page
      });
      if(apiPath == Api.getPopular){
        final response2 = await dio.get(apiPath, queryParameters: {
          'api_key': '2a0f926961d00c667e191a21c14461f8',
          'language': 'en-US',
          'page': 1
        });
     prefs.setString('data', jsonEncode(response2.data['results']));

      }
     final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
     return data;
    }on DioError catch (err){
       final data =  prefs.getString('data');
       final decodeData = (jsonDecode(data!) as List).map((e) => Movie.fromJson(e)).toList();
       return decodeData;

    }

  }


  static Future<List<Movie>> searchMovie({required int page,required String apiPath, required String searchText}) async{
    final dio = Dio();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key': '2a0f926961d00c667e191a21c14461f8',
        'language': 'en-US',
        'page': page,
        'query': searchText
      });


      if((response.data['results'] as List).isEmpty){
         return [Movie(
             title: 'no title',
             id: 0,
             overview: '',
             poster_path: '',
             release_date: '',
             vote_average: ''
         )];
      }else{
        final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
        return data;
      }

    }on DioError catch (err){
      print(err);
      return [];
    }

  }





}