import 'package:flutter_projects_start/models/news.dart';
import 'package:flutter_projects_start/services/news_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final newsProvider = FutureProvider.family((ref,String query) => NewsService.getNews(query: query));

final searchProvider = StateNotifierProvider<SearchNewsProvider, List<News>>((ref) => SearchNewsProvider());

class SearchNewsProvider extends StateNotifier<List<News>>{
  SearchNewsProvider() : super([]){

    getNews();
  }


  Future<void>  getNews() async{
    final response = await NewsService.getDefaultNews();
     state = response;
  }


}

