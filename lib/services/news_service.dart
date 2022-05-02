import 'package:dio/dio.dart';
import 'package:flutter_projects_start/api.dart';
import 'package:flutter_projects_start/models/news.dart';




class NewsService{

 static Future<List<News>> getNews({required String query}) async{
    final dio = Dio();
    try{
        final response = await dio.get(Api.baseUrl, queryParameters: {
          'q': query,
          'lang': 'en'
        }, options: Options(
          headers: {
            'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
            'X-RapidAPI-Key': '89e53c72d7msh16aa8c041814a4cp1f3e79jsn333d7bcaf747'
          }
        ));

        if(response.data['status'] == 'No matches for your search.'){
          return [News(
              title: 'No matches for your search.',
              author: '',
              media: '',
              link: '',
              published_date: '', summary:'')];
        }else{
          final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
          return data;
        }

    }on DioError catch (e){
      print(e.message);
      throw Exception(e.message);
    }

  }


 static Future<List<News>> getDefaultNews() async{
   final dio = Dio();
   try{
     await Future.delayed(Duration(seconds: 3));
     final response = await dio.get(Api.baseUrl, queryParameters: {
       'q': 'nasa',
       'lang': 'en'
     }, options: Options(
         headers: {
           'X-RapidAPI-Host': 'free-news.p.rapidapi.com',
           'X-RapidAPI-Key': '89e53c72d7msh16aa8c041814a4cp1f3e79jsn333d7bcaf747'
         }
     ));

     final data = (response.data['articles'] as List).map((e) => News.fromJson(e)).toList();
     return data;
   }on DioError catch (e){
     print(e.message);
     throw Exception(e.message);

   }

 }








}